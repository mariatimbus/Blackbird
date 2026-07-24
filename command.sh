#!/bin/bash

cd /Users/maria/Desktop && mv Blackbird blackbird && cd blackbird
npx create-react-app .

git branch -m main master
gh repo create --public --source=. --push

git checkout -b update_logo

sed -i '' "/import logo from/d" src/App.js
sed -i '' 's|src={logo}|src="https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg"|g' src/App.js
sed -i '' 's|href="https://reactjs.org"|href="https://www.propelleraero.com/dirtmate/"|g' src/App.js

git add src/App.js
git commit -m "Update logo and link to Propeller Aero"
git push origin update_logo

gh pr create --base master --head update_logo --title "Update logo" --body "Replace the React logo with the Propeller Aero footer logo and update the link to the Dirtmate page."

gh pr merge --merge --admin
