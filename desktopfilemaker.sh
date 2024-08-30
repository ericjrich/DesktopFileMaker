#!/usr/bin/env bash
# 20240829_2027_est_EJR

# Ask the user for the executable path
exec_path=$(zenity --file-selection --title="Select the Executable File" --text="Please select the executable file for which you want to create a desktop entry")

# If the user cancels the selection, exit the script
if [ $? -ne 0 ]; then
    echo "No executable selected. Exiting."
    exit 1
fi

# Ask for the name of the application
app_name=$(zenity --entry --title="Application Name" --text="Enter the name of the application")

# If the user cancels the input, exit the script
if [ $? -ne 0 ]; then
    echo "No application name entered. Exiting."
    exit 1
fi

# Create the ~/.icons directory if it doesn't exist
icon_dir="$HOME/.icons"
mkdir -p "$icon_dir"

# Ask the user for the icon path
icon_path=$(zenity --file-selection --title='Select the Icon File (Cancel To Add URL)' --file-filter="Images | *.png *.jpg *.svg" --text="Please select an icon file for the desktop entry")

# If the user cancels the icon selection, ask for a URL
if [ $? -ne 0 ]; then
    icon_url=$(zenity --entry --title='Icon URL (Try: iconfinder.com)' --text="No icon file selected. Please provide a URL for the icon")

    # If the user cancels the URL input, exit the script
    if [ $? -ne 0 ]; then
        echo "No icon URL provided. Exiting."
        exit 1
    fi

    # Download the icon from the URL and save it to ~/.icons
    icon_path="$icon_dir/$app_name.png"
    wget -O "$icon_path" "$icon_url"
else
    # Copy the selected icon to ~/.icons
    icon_ext="${icon_path##*.}"
    new_icon_path="$icon_dir/$app_name.png"
    cp "$icon_path" "$new_icon_path"
    icon_path="$new_icon_path"
fi

# Ask the user for the program type
program_type=$(zenity --list --title="Select Program Type" --text="Choose the type of program" --radiolist \
    --column="Select" --column="Program Type" \
    TRUE "Application" \
    FALSE "Utility" \
    FALSE "Game" \
    FALSE "System Tool")

# If the user cancels the selection, exit the script
if [ $? -ne 0 ]; then
    echo "No program type selected. Exiting."
    exit 1
fi

# Ask for a comment/description of the application
app_comment=$(zenity --entry --title="Application Comment" --text="Enter a brief description of the application")

# If the user cancels the input, exit the script
if [ $? -ne 0 ]; then
    echo "No comment entered. Exiting."
    exit 1
fi

# Determine the categories based on the program type
case $program_type in
    "Application")
        categories="Utility;"
        ;;
    "Utility")
        categories="Utility;"
        ;;
    "Game")
        categories="Game;"
        ;;
    "System Tool")
        categories="System;Settings;"
        ;;
    *)
        categories="Utility;"
        ;;
esac

# Create the .desktop file content
desktop_file="[Desktop Entry]
Type=Application
Name=$app_name
Comment=$app_comment
Exec=$exec_path
Icon=$icon_path
Categories=$categories
Terminal=false"

# Ask the user where to save the .desktop file
save_path=$(zenity --file-selection --directory --title="Select Directory to Save .desktop File")

# If the user cancels the selection, exit the script
if [ $? -ne 0 ]; then
    echo "No directory selected. Exiting."
    exit 1
fi

# Save the .desktop file
echo "$desktop_file" > "$save_path/$app_name.desktop"

# Make the .desktop file executable
chmod +x "$save_path/$app_name.desktop"

# Notify the user that the desktop entry has been created
zenity --info --title="Desktop Entry Created" --text="The desktop entry for $app_name has been successfully created at $save_path/$app_name.desktop"
