#!/bin/sh

# Get the absolute path to the directory containing this script
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# List of files to symlink
FILES_TO_SYMLINK=".zshrc"

# Target directory (usually the home directory)
TARGET_DIR="$HOME"

# Loop through files and create symlinks
for file in $FILES_TO_SYMLINK; do
  src="$DOTFILES_DIR/$file"
  dest="$TARGET_DIR/$file"

  # Check if the source file exists
  if [ ! -e "$src" ]; then
    echo "Source file $src does not exist. Skipping..."
    continue
  fi

  # Check if the destination already exists
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "File $dest already exists. Backing up to $dest.bak..."
    mv "$dest" "$dest.bak"
  else
    ln -s "$src" "$dest"
    echo "Created symlink: $dest -> $src"
  fi
done
