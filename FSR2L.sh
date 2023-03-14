#!/bin/bash

# Obsidian CLI Szmelc.INC - GitHub Force Sync [Remote -> Local] [R2L]

REMOTE="git@github.com:serainox420/Obsidian"
LOCAL="./Obsidian" # Will create same folder name as repository

# Initialize directory
if [ ! -d .git ]; then
  git init
fi

# Purge local Obsidian directory, clone remote, remove .git folder.
rm -fr "$LOCAL"
git clone "$REMOTE"
rm -fr "./Obsidian/.git"
