# --- eza ---
alias ls='eza --group-directories-first --icons'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'

# --- docker ---
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dcl='docker compose logs -f'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

# --- misc ---
alias cls='clear'
alias reload='source ~/.zshrc'

# --- search ---
alias grep='rg'
