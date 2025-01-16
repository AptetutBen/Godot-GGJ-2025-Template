class_name TextButtonGroup extends Control

signal close_action

var buttons : Array[MenuText]
var selectedButtonIndex : int = 0
var can_navigate : bool = true

@export var vertical : bool = true
@export var active : bool = false
@export var close_on_left : bool = false
@export var open_on_right : bool = false

func _ready() -> void:
	for child in get_children():
		if child is MenuText:
			buttons.append(child)
	
	selectedButtonIndex = _get_first_visable_button_index()
	select_button(selectedButtonIndex,false)
	for i in buttons.size():
		buttons[i].index = i 
		buttons[i].highlight_button.connect(select_button)
		buttons[i].on_click.connect(on_button_click)

func _get_first_visable_button_index() -> int:
	for i in buttons.size():
		if buttons[i].visible:
			return i
	return 0

func enable():
	if !is_visible_in_tree():
		_highlight_button(_get_first_visable_button_index())
	show()
	active = true

func disable(set_hide : bool = false):
	if set_hide:
		hide()
	active = false

func _on_close():
	close_action.emit()

func _on_select():
	buttons[selectedButtonIndex].trigger_action()

func select_button(index : int, play_sound : bool = true):
	if !active:
		return

	if play_sound:
		AudioManager.play_sfx("click1")
	_highlight_button(index)

func _highlight_button(index : int):
	selectedButtonIndex = index
	for i in buttons.size():
		if i == index:
			buttons[i].select_button()
		else:
			buttons[i].deselect_button()
	
func on_button_click(button_index : int) -> void:
	if !active:
		return
	AudioManager.play_sfx("click1")
	buttons[button_index].buttonAction.emit()
	active = false

func _find_next_active_button(current_index: int) -> int:
	for i in (buttons.size() -1):
		var button_to_check : int = (1 + current_index + i)%buttons.size()
		if buttons[button_to_check].is_visible_in_tree():
			return button_to_check
	return current_index

func _find_previous_active_button(current_index: int) -> int:
	for i in (buttons.size() -1):
		var button_to_check : int = fposmod((current_index - 1 - i),buttons.size())
		if buttons[button_to_check].is_visible_in_tree():
			return button_to_check
	return current_index

func _input(event: InputEvent) -> void:
	if !is_visible_in_tree() || !active :
		return

	if event.is_action_pressed("UI Cancel"):
		_on_close()
	
	if close_on_left && vertical && event.is_action_pressed("UI Left"):
		_on_close()
	
	if close_on_left && !vertical && event.is_action_pressed("UI Up"):
		_on_close()
	
	# Pause to stop previous menu also being triggered
	await get_tree().process_frame
	
	if event.is_action_pressed("UI Accept"):
		_on_select()
		
	if open_on_right && vertical && event.is_action_pressed("UI Right"):
		_on_select()
	
	if open_on_right && !vertical && event.is_action_pressed("UI Downs"):
		_on_select()
	
	if event.is_action_pressed("UI Up" if vertical else "UI Left"):
		if !can_navigate:
			return
		AudioManager.play_sfx("click1")
		buttons[selectedButtonIndex].deselect_button()
		selectedButtonIndex = _find_previous_active_button(selectedButtonIndex)
		select_button(selectedButtonIndex)
		can_navigate = false
		await get_tree().create_timer(0.05).timeout
		can_navigate = true
	
	if event.is_action_pressed("UI Down" if vertical else "UI Right"):
		if !can_navigate:
			return
		AudioManager.play_sfx("click1")
		buttons[selectedButtonIndex].deselect_button()
		selectedButtonIndex = _find_next_active_button(selectedButtonIndex)
		select_button(selectedButtonIndex)
		can_navigate = false
		await get_tree().create_timer(0.05).timeout
		can_navigate = true