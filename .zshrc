# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Append to history file instead of replacing
setopt SHARE_HISTORY           # Share history across all sessions
setopt HIST_IGNORE_DUPS        # Don't record duplicate entries
setopt HIST_IGNORE_ALL_DUPS    # Delete old duplicate entries
setopt HIST_FIND_NO_DUPS       # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE       # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS       # Don't save duplicate entries
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/alex/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/nvm/init-nvm.sh
