class_name CommandPanel extends Control

var commands : Array[ConsoleCommand]

var possible_commands : Array[ConsoleCommand]

var input_split : PackedStringArray

var command_history_list : Array[String]
var suggested_command_index : int = 0
var previous_command_index : int = 0

@onready var command_edit: LineEdit = %CommandEdit
@onready var suggested_text: LineEdit = %SuggestedText

@onready var output_label: Label = %"Output Label"
@onready var scroll_container: ScrollContainer = %ScrollContainer

func _ready() -> void:
	hide()
	command_edit.text_submitted.connect(_on_text_submitted)
	command_edit.text_changed.connect(_on_text_changed)
	
	commands.append(CommandHelp.new())
	commands.append(CommandQuit.new())
	commands.append(CommandFullScreen.new())
	commands.append(CommandClear.new())

func add_output(string : String):
	if string == "":
		return
	output_label.text += "\n" + string
	await get_tree().process_frame
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value

func _on_text_submitted(text : String):
	if text.length() == 0:
		return
	command_history_list.append(text)
	add_output(":"+text)
	command_edit.text = ""
	suggested_text.text = ""
	_run_command(text.split(" "))
	
func _on_text_changed(text : String):
	if text.length() == 0:
		suggested_text.text = ""
		return
	
	input_split = text.split(" ")
	
	if input_split.size() == 1:
		_get_possible_commands(input_split[0])
		
		if possible_commands.size() == 0:
			suggested_text.text = ""
			return
		else:
			suggested_command_index = 0
			_update_suggested_command()
			
func _update_suggested_command():
	if possible_commands.size() == 0:
		return
	suggested_text.text = possible_commands[suggested_command_index].command

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Command_Show"):
		if visible:
			hide()
		else:
			show()
			command_edit.text=""
			suggested_text.text = ""
			command_edit.grab_focus()
			get_viewport().set_input_as_handled()

func _edit_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"):
		accept_event()
		if possible_commands.size() == 0:
			return
		
		command_edit.text = possible_commands[suggested_command_index].command
		
		await get_tree().process_frame
		command_edit.caret_column = -1

	if event.is_action_pressed("ui_up"):
		accept_event()
		if possible_commands.size() <= 1:
			return
		
		suggested_command_index-=1
		if suggested_command_index < 0:
			suggested_command_index = possible_commands.size()-1
		await get_tree().process_frame
		command_edit.caret_column = -1
	
	if event.is_action_pressed("ui_down"):
		accept_event()
		if possible_commands.size() <= 1:
			return
		
		suggested_command_index = (suggested_command_index+1)%possible_commands.size()
		_update_suggested_command()
		
		await get_tree().process_frame
		command_edit.caret_column = -1
			
func _get_possible_commands(part : String) -> void:
	possible_commands.clear()
	
	for command : ConsoleCommand in commands:
		if command.command.to_lower().begins_with(part):
			possible_commands.append(command)
	
	possible_commands.sort()

func get_command(command_name : String) -> ConsoleCommand:
	for command in commands:
		if command.command == command_name.to_lower():
			return command
	
	return null

func get_command_list() -> String:
	var command_array : Array[String]
	
	for command in commands:
		command_array.append(command.command)
		
	return "- " +"\n- ".join(command_array)

func _run_command(command_array : PackedStringArray):
	for command in commands:
		if command.command == command_array[0].to_lower():
			add_output(command.run_command(command_array,self))
			return
	
	add_output(" Command not found : %s"%command_array[0])
	command_edit.caret_column = -1

func clear_console() -> void:
	output_label.text = ""
