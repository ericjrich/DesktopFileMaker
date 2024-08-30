# Desktop File Maker

`desktopfilemaker.sh` is a simple and interactive Bash script that helps you create `.desktop` files for your applications on Linux Mint Cinnamon (or other compatible Linux desktop environments). Using `zenity`, this script provides a GUI-based interface to guide you through selecting your executable, choosing an icon, and defining the application type.

## Features

- **User-Friendly Interface**: Interactively select your executable, icon, and application type using GUI dialogs.
- **Automatic Icon Handling**: Copies the selected icon to the `~/.icons/` directory, or downloads an icon from a URL if no file is selected.
- **Customizable Application Types**: Choose from common application types such as Application, Utility, Game, or System Tool.
- **Easy Desktop Entry Creation**: Creates a `.desktop` file with all necessary fields filled out, making it easy to launch your application from the desktop or menu.

## Requirements

- **Linux Mint Cinnamon** (or other compatible Linux desktop environments)
- **Zenity**: A tool for building graphical dialogs from shell scripts. Install it using:

    ```
    sudo apt-get install zenity
    ```

- **Wget**: A command-line utility for downloading files from the web. Install it using:

    ```
    sudo apt-get install wget
    ```

## Installation

1. **Clone the repository**:

    ```
    git clone https://github.com/yourusername/desktop-file-maker.git
    cd desktop-file-maker
    ```

2. **Make the script executable**:

    ```
    chmod +x desktopfilemaker.sh
    ```

## Usage

1. Run the script:

    ```
    ./desktopfilemaker.sh
    ```

2. Follow the on-screen prompts:
    - **Select the executable**: Choose the executable file you want to create a desktop entry for.
    - **Enter the application name**: Provide a name for your application.
    - **Select or provide an icon**: Choose an icon file or provide a URL if no file is selected. The icon will be saved in `~/.icons/` with the name you provided.
    - **Select the program type**: Choose the type of your application (e.g., Application, Utility, Game, System Tool).
    - **Enter a description**: Provide a brief comment or description of your application.
    - **Select save location**: Choose where to save the generated `.desktop` file.

3. After completing the prompts, the script will generate a `.desktop` file at your specified location, making your application accessible from the desktop or menu.

---

*Happy scripting! Make your Linux experience smoother with simple and efficient desktop entries!*
