# macOS-specific tools
alias find='fd'
alias cat='bat --paging=never'

# fzf (Homebrew)
if command -v brew >/dev/null 2>&1; then
  [ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  [ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi
