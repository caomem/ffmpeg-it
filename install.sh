#!/bin/bash

url="https://gitlab.com/gphilippi/ffmpeg-it/-/raw/master/ffmpeg-it"

# Destination directory in the user's PATH
dest_dir="$HOME/.local/bin"  # Change this to '~/bin' or other PATH directory if needed
mkdir -p $dest_dir 
script_name="smithify"

# Download the script
echo "Downloading $script_name from GitLab..."
curl -s $url -o "$dest_dir/$script_name"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "$script_name downloaded successfully!"
else
    echo "Failed to download $script_name."
    exit 1
fi

chmod +x "$dest_dir/$script_name"

# Verify if the script is now executable
if [ -x "$dest_dir/$script_name" ]; then
    echo "$script_name is now executable."
else
    echo "Failed to make $script_name executable."
    exit 1
fi

# Check if the destination directory is in the PATH
if ! echo $PATH | grep -q "$dest_dir"; then
    echo "$dest_dir is not in your PATH. You may need to add it manually."
    echo "Add the following line to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\$PATH:$dest_dir"
else
    echo "$script_name installation is complete!"
fi