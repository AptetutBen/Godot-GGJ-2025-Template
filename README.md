# Godot 4.4 Template Project

This is a Godot 4.4 template project designed to kickstart your game development with essential systems and features. It includes:

- **Audio Manager**: Easily manage and play sound effects and music.
- **Flow Controller**: Handle scene transitions and game flow.
- **Save System**: Save and load game data with ease.
- **Custom Terminal**: Debug and interact with the game using a built-in terminal.
- **Loading Scene**: Smooth transitions between scenes with a loading screen.
- **Main Menu**: A fully functional main menu with options.
- **Splash Screen**: A customizable splash screen for your game.

---

## Features

### 1. **Audio Manager**
   - Play, stop, and manage sound effects and music.
   - Scans for all audio in the 'Audio' folder and stores it in a dictionary so you only need the name of the file to play it
   - Adjust volume for different audio channels.
   - Saves volume levels
   - Example usage:
     ```gdscript
     AudioManager.play_sfx("click_1")
     AudioManager.play_sfx_at_position("explode_2", Vector3(30,0,20))
     AudioManager.play_music("background_music")
     ```

### 2. **Flow Controller**
   - Handle scene transitions and game flow.
   - Load scenes asynchronously with a loading screen.
   - Loads all scenes in the Scenes folder into a Dictionary so you can change the scene with just the scene name, with or without a loading screen
   - Example usage:
     ```gdscript
     FlowController.load_scene("Level 3")
     FlowController.load_scene("Level 1",false)
     ```

### 3. **Save System**
   - Save and load game data to/from a file.
   - Supports multiple save slots.
   - Example usage:
     ```gdscript
     SaveSystem.save_game("slot1", data)
     var loaded_data = SaveSystem.load_game("slot1")
     ```

### 4. **Custom Terminal**
   - Debug and interact with the game using a built-in terminal.
   - Execute commands and view logs in real-time.
   - Example usage:
     ```gdscript
     Terminal.execute_command("set_health 100")
     ```

### 5. **Loading Scene**
   - Smooth transitions between scenes with a progress bar.
   - Example usage:
     ```gdscript
     FlowController.load_scene_with_loading_screen("res://scenes/level_2.tscn")
     ```

### 6. **Main Menu**
   - A fully functional main menu with options to start, load, and quit the game.
   - Example usage:
     ```gdscript
     MainMenu.show()
     ```

### 7. **Splash Screen**
   - A customizable splash screen to display your game's logo or branding.
   - Example usage:
     ```gdscript
     SplashScreen.show_logo("res://assets/logo.png", 3.0)
     ```

---

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/godot-4.2-template.git
