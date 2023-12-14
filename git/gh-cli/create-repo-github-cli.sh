# create gh repo
# https://www.digitalocean.com/community/tutorials/workflow-github-cli
# https://cli.github.com/manual/gh_repo_create

gh repo create welcome-react --public

git add .
git commit -m "Stopped at Adding time travel"
git remote add origin git@github.com:justgithubaccount/welcome-react.git
git branch -M main
git push -u origin main