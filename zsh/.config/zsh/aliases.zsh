# --- ALIASES ---
#alias open="xdg-open"
alias make="make -j`nproc`"
alias ninja="ninja -j`nproc`"
alias n="ninja"
alias c="clear"
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="sudo pacman -Syu"
# alias hc="~/.config/hypr/"
alias nv="nvim"
alias dotfiles="cd ~/qui3tqu3st-dotfiles/"
alias dev="cd ~/qui3tqu3st/programming/"
alias config="cd ~/.config/"

# git related aliased
alias lg="lazygit"

# nvim reset
alias nvimreset="zsh ~/qui3tqu3st-dotfiles/scripts/reset-nvim-config.sh"

# clean btrfs-snapper-snapshots
alias cleansnapper="zsh ~/qui3tqu3st-dotfiles/scripts/cleansnapshots.sh"

# custom code runner
alias r="zsh ~/qui3tqu3st-dotfiles/scripts/runner.sh"

# competetive programming
alias input="zsh ~/qui3tqu3st-dotfiles/scripts/input.sh"
alias output="zsh ~/qui3tqu3st-dotfiles/scripts/output.sh"
alias create="cp ~/qui3tqu3st/programming/C++/template.cpp"

# hyprland specific configs
alias reloadwb="pkill waybar && hyprctl dispatch exec waybar"


# Monitor related aliases [hyprland]
alias sclt="zsh ~/qui3tqu3st-dotfiles/scripts/sc-laptop-toggle.sh"

# Cleanup orphaned packages
# alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

