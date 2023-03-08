import dwm, queue, threading
import os, math, time

q = queue.Queue()

tag_to_string = {
        0: "zero", 
        1: "one", 
        2: "two", 
        4: "three", 
        8: "four", 
        16: "five", 
        32: "six", 
        64: "seven", 
        128: "eight", 
        256: "nine", 
        511: "all"}

def main():
    print("main thread working!")
    while True:
        time.sleep(0.1)
        if q.qsize() != 0:
            json_obj = q.get()
            current_tag = json_obj["tag_change_event"]["new_state"]["selected"]
            current_tag_name = tag_to_string[current_tag]
            os.system(f"eww update tag-{current_tag_name}='active'")
            last_tag = json_obj["tag_change_event"]["old_state"]["selected"]
            last_tag_name = tag_to_string[last_tag]
            os.system(f"eww update tag-{last_tag_name}='idle'")
            q.task_done()

threading.Thread(target=main, daemon=True).start()
print("starting getting dwm-msgs")
dwm.subscribe("tag_change_event", q)
