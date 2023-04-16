## Setup

1. Install HomeBrew
2. Install Alacritty via HomeBrew
	- `mkdir -p ~/.config/alacritty/themes`
	- `git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes`
	- `brew tap homebrew/cask-fonts` # introduce Hack Nerd Fonts
	- `brew install font-hack-nerd-font`
	- `brew install font-dejavu-sans-mono-nerd-font`
3. Install ASDF via HomeBrew
4. Install Fish via HomeBrew
5. Install TMUX via HomeBrew
	- `ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf`
6. Clone this repo into ~/.config folder
7. NVim is out, Helix is in :)
	- `brew install helix`
	- `ElixirLS` should be installed in .config and `language-server.sh` should get renamed to `elixir-ls` for Helix to work
8. Lazygit is awesome - definite add!
	- `brew install lazygit`
9. Zk for notes
	- `brew install zk`
	- `brew install fzf`
	- `brew install bat`

