fish_add_path /opt/homebrew/bin

if status is-interactive
and not set -q TMUX
    if tmux has-session -t home
	exec tmux attach-session -t home
    else
        tmux new-session -s home
    end
end

source (brew --prefix asdf)/libexec/asdf.fish
fish_add_path ~/.cargo/bin/
fish_add_path ~/.config/elixir-ls
