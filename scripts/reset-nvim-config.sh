rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

cd ~/qui3tqu3st-dotfiles/
stow -D nvim
rm -rf ~/quietquest-dotfiles/nvim/.config/nvim

