extends Node2D

@onready var score_input: LineEdit = %ScoreInput

var _client: GdftClient
var _playing: bool = false
var _score: int = 0

func _ready() -> void:
	_client = preload("res://scenes/gdft.gd").new()
	add_child(_client)
	_client.enable_debug_view = true # optional debug overlay, comment or remove line to disable
	_client.start_polling()


func _process(_delta: float) -> void:
	if _client and _playing:
		if _score != int(score_input.text):
			_score = int(score_input.text)
			_client.send_score(_score, false)

func _on_start_button_pressed() -> void:
	var score_text = score_input.text
	if score_text.is_valid_int():
		_score = int(score_text)
		print("Starting game with score: ", _score)
		_playing = true
		_client.send_score(_score, false)
	else:
		push_warning("Invalid score: ", score_text, " (Please enter a valid integer)")
		

func _on_finish_button_pressed() -> void:
	print("Game Finished with score: ", _score)
	_playing = false
	_client.send_score(_score, true)
