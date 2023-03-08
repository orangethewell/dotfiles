RUN = "run_command"
MONITORS = "get_monitors"
TAGS = "get_tags"
LAYOUTS = "get_layouts"
DWM_C = "get_dwm_client"
SUBSC = "subscribe"
DWM_IPC = "dwm-msg"

import subprocess, json, queue

def subscribe(event: str, queue_bounder: queue.Queue):
    process = subprocess.Popen([DWM_IPC, "--ignore-reply", SUBSC, event], stdout=subprocess.PIPE)
    current_json_file = []
    while True:
        output = process.stdout.readline().decode("utf-8")
        if output == "}\n":
            current_json_file.append(output)
            jsobject = json.loads("".join(current_json_file))
            queue_bounder.put(jsobject)
            current_json_file = []
        else:
            current_json_file.append(output)
