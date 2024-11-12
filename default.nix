{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.neovim
    pkgs.fish
    pkgs.fzf
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.rustup
    pkgs.starship
    pkgs.nodejs
    pkgs.git
	pkgs.neovide
  ];

  shellHook = ''
    # Clone Neovim config if not already present
    if [ ! -d "$HOME/.config/nvim" ]; then
      git clone https://github.com/YilunAllenChen/nvim $HOME/.config/nvim
    fi

	alias n="nvim"
    alias cvim="nvim ~/.config/nvim"
	alias eb="nvim ~/.config/fish/config.fish"
	alias sb="source ~/.config/fish/config.fish"

	fish
  '';
}
