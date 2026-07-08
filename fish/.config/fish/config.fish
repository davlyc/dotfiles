if status is-interactive
  set fish_color_autosuggestion 8B8B8B
end

alias fastfetch="clear && ~/.config/fastfetch/fastfetch-wrapper.sh"
alias cava="~/.config/cava/cava-wrapper.sh"
alias btop="~/.config/btop/btop-wrapper.sh"

sleep 0.1 && ~/.config/fastfetch/fastfetch-wrapper.sh

starship init fish | source

fish_add_path /Users/davinyonathan/.spicetify

# OpenClaw Completion
source "/Users/davinyonathan/.openclaw/completions/openclaw.fish"

# opencode
fish_add_path /Users/davinyonathan/.opencode/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/davinyonathan/.lmstudio/bin
# End of LM Studio CLI section

