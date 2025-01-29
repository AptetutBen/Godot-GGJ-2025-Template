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
   - Plays footstep audio
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
   - Supports etheral data that does not get saved and clears when the game is quit
   - Supports saving, Strings, Floats, Ints and Bools
   - Also saves Game Settings in a seperate file such as volume, screen size, fullscreen, vsync
   - Getting saved variables can be provided a default value that will be returned if the value isn't set 
   - Example usage:
     ```gdscript
     SaveController.set_value("key","value")
     SaveController.get_value("key","default value")
     SaveController.set_value_bool("key",true)
     SaveController.get_value_bool("key",true)
     SaveController.set_value_float("key",5.4)
     SaveController.get_value_float("key",1.5)
     SaveController.set_value_int("key",2)
     SaveController.get_value_int("key",1)

     SaveController.set_etheral_value("key","value")
     SaveController.get_etheral_value("key","default value")
     SaveController.set_etheral_value_bool("key",true)
     SaveController.get_etheral_value_bool("key",true)
     SaveController.set_etheral_value_float("key",5.4)
     SaveController.get_etheral_value_float("key",1.5)
     SaveController.set_etheral_value_int("key",2)
     SaveController.get_etheral_value_int("key",1)
     ```

### 5. **Loading Scene**
   - A customizable loading screen
   - When a scene is loaded with a 'Use Loading Screen' argument is provided (default) this scene will show.
   - This scene can be updated whoever you wish

### 7. **Splash Screen**
   - A customizable splash screen to display your game's logo or branding.
   - This scene can be updated whoever you wish

