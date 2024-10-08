#!/bin/bash

# Get current directory path
CURRENT_DIR="$(pwd)"

# Specify the path to BCNTB Documentation internal folder
REPO_DIR="$1"
REMOTE_BRANCH="origin/test"

# Navigate to the repository directory
cd $REPO_DIR || { echo "Repo directory not found!"; exit 1; }

# Fetch the latest changes from the remote repository
git fetch

# Get the latest commit hash from the local and remote branches
LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse $REMOTE_BRANCH)

# Compare the commits
if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
    echo "New updates found! Performing synchronisation..."
    
    # Perform synchronisation
    git pull origin main

    # Generate docs
    cd "$CURRENT_DIR/bcntb-documentation"
    bash generate_docs.sh $REPO_DIR
    git add .
    git commit -m "Sync docs"
    git push

    # Deploy website
    cd ..
    git add bcntb-documentation
    git commit -m "Sync doc website"
    git push
    echo "Synchronisation completed"
else
    echo "No new updates found."
fi
