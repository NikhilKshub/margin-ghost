# Margin Ghost
A hand-drawn puzzle platformer set inside a notebook. You can't walk normally, so you draw your own path with a pencil, and a little ghost hops along the dots to reach the exit.
Watch out, though. The paths aren't always safe.

## Play it
- **Play in your browser:** [PLAY](https://nikhilkshub.itch.io/margin-ghost)

## How to play
| Input | Action |
|---|---|
| Hold left mouse button and drag | Draw a pencil path |
| Left / Right arrow keys | Hop to the nearest dot on that side |
| R | Restart the current level |

Draw a path from the entry gate towards the exit gate. Your ghost can only hop between dots on the lines you draw.
You cannot freely walk or jump around the level. Every movement depends on the paths you create.
Be careful where you draw. 

## Features
- Hand-drawn notebook-style environments and artwork.
- Custom character with idle, walking, jumping and special animations.
- Draw-your-own-path gameplay with evenly spaced dots.
- Smooth hopping with a jumping arc.
- Character flips depending on movement direction.
- Custom pencil mouse cursor.
- Animated environmental elements, including the sun and clouds.
- Invisible collision zones for spikes and other hazards.
- Falling box that destroys dots and cuts drawn paths.
- Automatic falling when the player's supporting dot disappears.
- Multiple levels with connected exit gates.
- Ending screen with a restart option.
- Background music managed through Godot's Autoload system.

## Built with
- [Godot Engine](https://godotengine.org/) 4.7
- GDScript
- Custom hand-drawn PNG artwork and animated sprite sheets.
- Godot's built-in 2D physics and collision system.
- AudioStreamPlayer for background music.

## Credits
- **Game design and development:** Nikhil Kunwar
- **Art and level design:** Nikhil Kunwar, Manmeet Sehrawat, Bhuvan Rai
- **Character and environmental artwork:** Bhuvan Rai, Manmeet Sehrawat
- **Music:** Glyph Composer(By Nothing) - Bhuvan Rai
- **Engine:** Godot Engine

## AI assistance
Claude and ChatGPT was used for coding assistance like solving bugs, helping in implement complex features, guiding through the platform, explaining things and helping in concepts for code and solving bugs, fixing things like size, coordinate points. Other than that all the code is self written and assets were hand drawn.

## Run it locally
1. Install [Godot Engine 4.7](https://godotengine.org/download).
2. Clone or download this repository.
3. Open Godot and click **Import**.
4. Select the `project.godot` file from the project folder.
5. Wait for the assets to import.
6. Press **F5** to run the game.
The main scene is `level_1.tscn`.

## Known issues
- This is an early playable version with two levels.
- Some gameplay mechanics and visual elements may need further balancing and polish.
- The levels currently use fixed layouts and hand-placed collision zones.
- In the browser version, click inside the game once to enable keyboard input.
- More levels, hazards and mechanics are planned.
