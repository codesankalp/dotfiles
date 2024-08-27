CONFIG_PATH = $(HOME)/.config

.PHONY: help
## help: show help commands
help:
	@echo "Usage:\n"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: alacritty
## alacritty: terminal emulator written in rust
alacritty:
	@mkdir -p $(CONFIG_PATH)/alacritty;
	@ln -fs "$(CURDIR)/config/alacritty/alacritty.toml" $(CONFIG_PATH)/alacritty/alacritty.toml;

.PHONY: tmux
## tmux: terminal multiplexer
tmux:
	@ln -fs "$(CURDIR)/config/tmux/.tmux.conf.local" $(HOME)/.tmux.conf.local;

.PHONY: nvim
## nvim: neovim
nvim:
	@ln -fs "$(CURDIR)/config/nvim/" $(CONFIG_PATH);

.PHONY: zsh
## zsh: zsh shell
zsh:
	@ln -fs "$(CURDIR)/config/zsh/.zshrc" $(HOME)/.zshrc;
	@ln -fs "$(CURDIR)/config/zsh/.p10k.zsh" $(HOME)/.p10k.zsh;
	@ln -fs "$(CURDIR)/config/zsh/aliases.zsh" ~/.oh-my-zsh/custom/aliases.zsh;

.PHONY: git
## git: git
git:
	@ln -fs "$(CURDIR)/config/git/.gitconfig" $(HOME)/.gitconfig;

.PHONY: wakatime
## wakatime: wakatime
wakatime:
	@ln -fs "$(CURDIR)/config/wakatime/.wakatime.cfg" $(HOME)/.wakatime.cfg;
