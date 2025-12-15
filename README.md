## GDFG MiniGame Godot Example

This is a simple example of how to use the GDFG MiniGame Score reporter and debug overlay.

You can start from this project or copy files into your own project following the instructions below.

![Demo](./demo.gif)

# Setup

Copy the following files into your /scenes folder:
- gdft.gd
- gdft_debug.gd
- gdft_debug.tscn

IMPORTANT: If these files are not in the /scenes folder you will need to modify line 320 of gdft.gd to point to the correct location.
```
var scene = load("res://scenes/gdft_debug.tscn")
```

In your game scene, add the following code:
```
var _client: GdftClient

func _ready() -> void:
	_client = preload("res://scenes/gdft.gd").new() 
	add_child(_client)
	_client.enable_debug_view = true # optional debug overlay, comment or remove line to disable
	_client.start_polling()
```
IMPORTANT: if reporter is not in /scenes make sure to modify preload() path above.

# Usage

To periodically send scores while the game is running, call:
```
_client.send_score(score, false)
```
Only call this when the score has changed. DO NOT CALL THIS EVERY PROCESS FRAME!

To send the final score, call:
```
_client.send_score(score, true)
```
