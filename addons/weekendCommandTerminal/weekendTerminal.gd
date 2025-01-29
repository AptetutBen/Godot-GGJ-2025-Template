extends CanvasLayer

@onready var COMMAND_TERMINAL : PackedScene = preload("res://addons/weekendCommandTerminal/command_terminal.tscn")

func _ready() -> void:
	layer = 100
	var terminal = COMMAND_TERMINAL.instantiate()
	add_child(terminal)
	#terminal._ready()
