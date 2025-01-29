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

Godot Audio Manager Plugin
A robust audio management system for Godot 4

Simplify SFX, music, 3D audio, and dynamic footstep sounds with pooling, fading, and volume controls.

Features ✨
Audio Pooling - Pre-allocated 2D/3D/music players

Dynamic Footsteps - Terrain-based sounds (grass/water/rock)

Smooth Fades - Crossfade music, fade-in/out effects

Volume Control - Master/SFX/Music sliders with saving

Auto File Scanning - Organizes SFX/Music/Footsteps

3D Audio - Positional sound effects

Installation 📦
Add audio_manager.gd to your project

Set as Autoload:

Go to Project > Project Settings > Autoload

Set path to script and name it AudioManager

Create folder structure:

Copy
Audio/  
├── SFX/  
├── Music/  
└── Footsteps/  
    ├── Dirt/  
    ├── Grass/  
    ├── Rock/  
    ├── Sand/  
    └── Water/  
    
Tutorials 🎓
1. Basic SFX Playback
gdscript
Copy
# Play explosion sound at 80% volume
AudioManager.play_sfx("explosion", volume=0.8)
2. Music with Fade Transition
gdscript
Copy
# Start music with 2-second fade-in
AudioManager.play_music("main_theme", fade_duration=2.0)

# Fade out current music over 1.5 seconds
AudioManager.fade_current_song()
3. 3D Positional Audio
gdscript
Copy
# Play laser sound at (5,0,10) in 3D space
AudioManager.play_sfx_at_position("laser", Vector3(5, 0, 10))
4. Footstep System
gdscript
Copy
# Play grass footstep (index 2) at 50% volume
AudioManager.play_footstep_sound(2, 0.5)
Terrain Indices:

gdscript
Copy
-1: Water  
0: Sand  
1: Rock  
2: Grass  
3: Dirt  
5. Volume Control
gdscript
Copy
# Set volumes (0.0-1.0 range)
AudioManager.set_master_volume(0.8)
AudioManager.set_sfx_volume(0.7)
AudioManager.set_music_volume(0.6)
Configuration ⚙️
Adjust pool sizes in _init():

gdscript
Copy
_create_2DaudioSources(2)   # 2D SFX channels  
_create_3DaudioSources(5)   # 3D SFX channels  
_create_musicAudioSources(2) # Music channels
File Requirements
Supported formats: .wav, .mp3, .ogg

Naming Convention:

explosion.wav → Use as "explosion"

forest_theme.mp3 → Use as "forest_theme"

This is raw markdown text - paste it directly into a README.md file. Let me know if you need adjustments!

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

