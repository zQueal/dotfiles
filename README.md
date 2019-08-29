# Dotfiles

These are the dotfiles that I use for ArchLabs. Changes are tracked with Git, and hosted here. Everything else is managed with GNU Stow.

# How I Did This

1. Install `stow` 
2. `git init`
2. Create `~/.dotfiles`
3. Create folders inside `~/.dotfiles` for each dotfile group, git, vim, zsh, etc
4. **Move** (do not copy) those dotfiles to the appropriate folders within `~/.dotfiles`
5. Run stow; `stow vim`
6. Stow creates all the syslinks for you
7. Profit?

# How to Use

1. Install `stow`
2. Clone this repo;

    > git clone https://github.com/zQueal/dotfiles ~/.dotfiles
    
3. Run `stow vim` to symlink all files in `~/.dotfiles/vim` to `~`
4. Profit?

# Issues

If you run into any issues, especially because you may need to *delete* config files before you `stow` to avoid conflicts, what I've been doing is adding the files to be removed to a `.tar` file, deleting, stowing, and then decompressing the archive. This is helpful especially with the `.config` directory, where there may be files that are *not* in the repository but *are* on your local machine. Doing it this way ensures that you get both the files from the repo, and keep the current configuration files you have. Maybe in the future I'll write in a way to automate this.
