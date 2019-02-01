workflow "Deploy to GitHub Pages" {
  on = "push"
  resolves = ["khanhicetea/gh-actions-hugo-deploy-gh-pages"]
}

action "khanhicetea/gh-actions-hugo-deploy-gh-pages" {
  uses = "khanhicetea/gh-actions-hugo-deploy-gh-pages@master"
  secrets = [
    "GIT_DEPLOY_KEY",
  ]
}
