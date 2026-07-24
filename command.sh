#!/bin/bash

# Step 1: Create a React app using create-react-app
# The original directory name "Blackbird" contains a capital letter, which
# create-react-app does not allow, so it is renamed to lowercase first.
cd /Users/maria/Desktop && mv Blackbird blackbird && cd blackbird
npx create-react-app .

# Step 2: Commit the code
# create-react-app automatically initializes a git repo and commits the initial
# files, so no extra commit command is required here.

# Step 3: Create a public GitHub repo using the GitHub CLI and push the code
# Rename the default "main" branch to "master" so the PR can target "master".
git branch -m main master
gh repo create --public --source=. --push

# Step 4: Switch to the "update_logo" branch
git checkout -b update_logo

# Step 5: Replace the existing logo
# Step 6: Replace the existing link
sed -i '' "/import logo from/d" src/App.js
sed -i '' 's|src={logo}|src="https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg"|g' src/App.js
sed -i '' 's|href="https://reactjs.org"|href="https://www.propelleraero.com/dirtmate/"|g' src/App.js

# Step 7: Commit and push the changes
git add src/App.js
git commit -m "Update logo and link to Propeller Aero"
git push origin update_logo

# Step 8: Create a PR from "update_logo" to "master" using the GitHub CLI
gh pr create --base master --head update_logo --title "Update logo" --body "Replace the React logo with the Propeller Aero footer logo and update the link to the Dirtmate page."

# Step 9: Merge the PR using the GitHub CLI (approval step skipped as instructed)
gh pr merge --merge --admin

# REPO_URL https://github.com/mariatimbus/Blackbird
