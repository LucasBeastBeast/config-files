# config-files
This is the setup for my Ubuntu Development Environment. Feel free to use it :)

## Setup
- Window Manager = i3 v4.23
- Terminal = kitty v0.35.2
- Editor = NVIM v0.10.1
    - Plugins = nvim-treesitter, telescope, harpoon, fugitive, undotree
    - LSP setup using Mason
- Compositor = picom v10
- Game Engine = Godot v4.2.2

## Prerequisites
- xinput v1.6.4
- nitrogen v1.6.1
- Brave Browser v127.1.68.141
- Spotify PWA installed from Brave
- discord v0.0.64
- xss-lock v0.3.0
- amixer v1.2.9
- brightnessctl v0.5
- dmenu v5.2
- xprop v1.2.6
- maim v5.7.4
- Ubuntu Bold Font
- URW Gothic Book Font

## Important Considerations
- Ensure paths of all the forementioned apps are added to your shell.
- To use kitty, it should be set as your default terminal.
    - Run following command with your kitty's path:
    ```bash
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator kitty_path 50
    ```
- i3 should be able to change your screen brightness without password:
   - Open sudoers.tmp
   ```bash
    sudo visudo
    ```
    - Add the following line with your username and save:
    ```bash
    your_username ALL=(ALL) NOPASSWD: /usr/bin/brightnessctl
    ```
- In `i3/config:ln 19`, I used `title="untitled \(DEBUG\)"` to assign Godot's debug window because my Godot project's name is `untitled`. Change your title accordingly.
- In `i3/config:ln 22 & 38`, I used the instance of Spotify PWA to assign it to workspace 6. Your instance may differ from mine. To get your Spotify's instance:
    - Open Spotify
    - In terminal, run:
    ```bash
    xprop
    ```
    - Click on your app
    - Find `WM_CLASS(STRING)` field
    - The first value is your Spotify's instance.
    ```
    WM_CLASS(STRING) = "crx_pjibgclleladliembfgfagdaldikeohf", "Brave-browser"
    ```
- In `i3/config:ln 25 & 26`, `10` is my touchpad's id. To find your touchpad id:
    ```bash
    xinput list
    ```
- A wallpaper should be set up for nitrogen to restore it on startup
    ```bash
    nitrogen --set-zoom-fill image_name
    ```
- A `Screenshots` folder should exist inside `~/Pictures/` to store the screenshots. Alternatively, you can change the your desired storage path from `i3/confid:ln 151`.


