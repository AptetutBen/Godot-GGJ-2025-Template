extends Control

@onready var credits: Credits = %Credits
@onready var version_label: Label = $"Version Label"

@onready var main_buttons: TextButtonGroup = %"Main Buttons"
@onready var options_buttons: TextButtonGroup = %"Options Buttons"

@onready var fullscreen_button: MenuTextToggle = %"Fullscreen Button"
@onready var vsync_toggle: MenuTextToggle = %"Vsync Toggle"

func _ready():
	AudioManager.play_music("Main Menu Music")
	credits.hide()
	options_buttons.hide()
	main_buttons.show()
	version_label.text = "v " + ProjectSettings.get_setting("application/config/version")
	fullscreen_button.visibility_changed.connect(_fullscreen_visibility_changed)
	fullscreen_button.button_toggle_action.connect(_fullscreen_toggled)	
	vsync_toggle.visibility_changed.connect(_vsync_visibility_changed)
	vsync_toggle.button_toggle_action.connect(_vsync_toggled)	

func _on_start_button_pressed():
	FlowController.start_game()
	AudioManager.play_sfx("click1")

func _on_exit_button_pressed():
	AudioManager.play_sfx("click1")
	get_tree().quit()

func _on_credits_button_pressed():
	AudioManager.play_sfx("click1")
	credits.show_panel()
	main_buttons.disable()

func _on_close_credits_button_pressed():
	AudioManager.play_sfx("click1")
	credits.hide_panel()
	main_buttons.enable()

func _on_options_button_pressed():
	AudioManager.play_sfx("click1")
	options_buttons.enable()
	main_buttons.disable()

func _on_back_button_button_action() -> void:
	AudioManager.play_sfx("click1")
	options_buttons.disable(true)
	main_buttons.enable()
	
func _fullscreen_visibility_changed() -> void:
	if !fullscreen_button.visible:
		return
	fullscreen_button.toggle(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)
	
func _fullscreen_toggled(value : bool) -> void:
	value = !value
	SaveController.set_fullscreen(value)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if value else DisplayServer.WINDOW_MODE_WINDOWED)
	fullscreen_button.toggle(value)

func _vsync_visibility_changed() -> void:
	if !vsync_toggle.visible:
		return
	vsync_toggle.toggle(DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED)
	
func _vsync_toggled(value : bool) -> void:
	value = !value
	SaveController.set_vsync(value)
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if value else DisplayServer.VSYNC_DISABLED)
	vsync_toggle.toggle(value)
