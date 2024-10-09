#!/bin/bash

# Clone the BCNTB Documentation internal repo
echo "Performing synchronisation..."
git clone git@github.qmul.ac.uk:bci-btx-bioinfo/BCNTB-Documentation.git

# Generate docs
cd bcntb-documentation
bash generate_docs.sh ../BCNTB-Documentation  # Run generate docs script
rm -rf ../BCNTB-Documentation

# Commit and Push Changes in Submodule
git add .
git commit -m "Sync docs" || echo "No changes to commit"  # Commit changes, ignore if nothing to commit
git push

# Commit and Push Changes to Main Repo
cd ..
git add bcntb-documentation
git commit -m "Sync doc website" || echo "No changes to commit"  # Commit changes, ignore if nothing to commit
git push

echo "Synchronisation completed"
