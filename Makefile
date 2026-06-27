CONFIG_PATH = $(HOME)/.config

.PHONY: help
## help: show help commands
help:
	@echo "Usage:\n"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: all
## all: symlink every config
all: wezterm tmux nvim zsh git wakatime agents

.PHONY: wezterm
## wezterm: terminal emulator written in rust
wezterm:
	@ln -fs "$(CURDIR)/config/wezterm/wezterm.lua" ~/.wezterm.lua;

.PHONY: tmux
## tmux: terminal multiplexer
tmux:
	@ln -fs "$(CURDIR)/config/tmux/.tmux.conf.local" $(HOME)/.tmux.conf.local;

.PHONY: nvim
## nvim: neovim (run nvim afterwards to finish plugin install)
nvim:
	@if [ ! -d "$(CONFIG_PATH)/nvim" ]; then \
		git clone https://github.com/NvChad/starter $(CONFIG_PATH)/nvim; \
	else \
		echo "nvim config already present at $(CONFIG_PATH)/nvim"; \
	fi

.PHONY: nvim-update
## nvim-update: update neovim config
nvim-update:
	@cd $(CONFIG_PATH)/nvim && git pull origin main;

.PHONY: nvim-clean
## nvim-clean: clean neovim config
nvim-clean:
	@rm -rf $(CONFIG_PATH)/nvim;
	@rm -rf $(HOME)/.local/share/nvim;
	@rm -rf $(HOME)/.local/state/nvim;


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
	@cp "$(CURDIR)/config/wakatime/.wakatime.cfg" $(HOME)/.wakatime.cfg;
	@if grep -q "YOUR_WAKATIME_API_KEY" $(HOME)/.wakatime.cfg; then \
		read -p "Enter WakaTime API Key: " key; \
		sed -i '' "s/YOUR_WAKATIME_API_KEY/$$key/" $(HOME)/.wakatime.cfg; \
		echo "WakaTime API key configured in $(HOME)/.wakatime.cfg"; \
	fi

.PHONY: agents
## agents: AI agent instructions (generic source, symlinked where each tool expects it)
agents:
	@mkdir -p $(HOME)/.claude;
	@ln -fs "$(CURDIR)/prompts/AGENTS.md" $(HOME)/.claude/CLAUDE.md;

.PHONY: lint
## lint: run shellcheck on shell scripts
lint:
	@shellcheck scripts/*
