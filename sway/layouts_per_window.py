#!/usr/bin/env python3
import i3ipc

layouts = {}
previous_id = None
ipc = i3ipc.Connection()


def on_focus(ipc, event):
    global previous_id

    current_index = 0
    inputs = ipc.get_inputs()
    for i in inputs:
        if i.type == "keyboard" and i.xkb_active_layout_index is not None:
            current_index = i.xkb_active_layout_index
            break

    if previous_id:
        layouts[previous_id] = current_index

    container = event.container
    if not container:
        return

    current_id = container.id
    previous_id = current_id

    target_index = layouts.get(current_id, 0)

    if target_index != current_index:
        ipc.command(f'input "type:keyboard" xkb_switch_layout {target_index}')


ipc.on("window::focus", on_focus)
ipc.main()
