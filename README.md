# Dotfiles

These are the dotfiles that I use for ArchLabs. Changes are tracked with Git, and hosted here. Everything else is managed with GNU Stow.

# How I Did This

1. Install `stow`
2. Create `~/.dotfiles`
3. Create folders inside `~/.dotfiles` for each dotfile group, git, vim, zsh, etc
4. **Move** (do not copy) those dotfiles to the appropriate folders within `~/.dotfiles`
5. Run stow; `stow vim`
6. Stow creates all the syslinks for you
7. Profit?

# How to Use

1. Clone this repo to `~/.dotfiles`
2. Install `stow`
3. Run `stow vim` to symlink all files in `~/.dotfiles/vim` to `~`
4. Profit?
