
.PHONY: tools-fastfetch-install
tools-fastfetch-install:
	@$(shell ./tools/fastfetch.sh install)

.PHONY: tools-fzf-install
tools-fzf-install:
	@$(shell ./tools/fzf.sh)

.PHONY: tools-nnn-install
tools-nnn-install:
	@$(shell ./tools/nnn.sh)

.PHONY: tools-fnm-install
tools-fnm-install:
	@$(shell ./tools/fnm.sh)

.PHONY: tools-rustup-install
tools-rustup-install:
	@$(shell ./tools/rustup.sh)

.PHONY: tools-nodejs-install
tools-nodejs-install:
	@$(shell ./tools/nodejs.sh)
