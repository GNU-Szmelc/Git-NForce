#!/bin/bash

# Obsidian CLI Szmelc.INC - GitHub Force Sync [Local -> Remote] [L2R]

# Define variables for the script
VAULT_FOLDER="./Obsidian Vault" # Local folder
SCRIPT_FOLDER="./Shell" # Supplementary scripts.sh
GITHUB_REPO="git@github.com:serainox420/Obsidian.git" # Target repo

# Navigate to the script's directory
cd "$(dirname "$0")"

# Check if the vault folder exists
if [ ! -d "$VAULT_FOLDER" ]; then
  echo "Vault folder not found at $VAULT_FOLDER"
  exit 1
fi

# Check if git is installed
if ! [ -x "$(command -v git)" ]; then
  echo "Error: git is not installed." >&2
  exit 1
fi

# Initialize the git repository if it doesn't already exist
if [ ! -d .git ]; then
  git init
fi

# Add the Obsidian Vault folder to the git repository
git add "$VAULT_FOLDER" && git add "$SCRIPT_FOLDER"

# Commit any changes to the repository
git commit -m "Sync Obsidian Vault folder"

# Push the changes to the remote repository
git push "$GITHUB_REPO" master --force

git pull "$GITHUB_REPO" master --force
