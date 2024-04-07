# dotfiles
All of my configs, backed up using GNU Stow

## Setup:
1. Clone the repo(dotfiles), preferably at home "~/".
2. CD into the "repo(dotfiles)/shome" directory.
3. Run `stow -vt ~ *` inside `shome`

The repo references the nvim starter repo, run the following after clone
1. `git submodule init`
2. `git submodule  update`
