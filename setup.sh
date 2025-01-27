#!/bin/sh

REPO_URL="https://github.com/cotyhamilton/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
FILES_TO_SYMLINK=".zshrc"

echo "Cloning dotfiles repository..."
if [ -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles directory already exists. Pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
else
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

echo "Creating symlinks..."
for file in $FILES_TO_SYMLINK; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"

  if [ -e "$dest" ]; then
    echo "File $dest already exists. Backing up to $dest.bak..."
    mv "$dest" "$dest.bak"
  fi

  ln -sf "$src" "$dest"
  echo "Symlinked $src to $dest"
done

echo "Dotfiles setup complete!"
