let
  # Import the Neovim nightly overlay
  neovimNightlyOverlay = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  });

  # Apply the overlay to your package set
  pkgs = import <nixpkgs> {
    overlays = [ neovimNightlyOverlay ];
  };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.neovim
    pkgs.fish
	pkgs.curl
    pkgs.fzf
	pkgs.wget
	pkgs.rustup
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.starship
    pkgs.nodejs
    pkgs.git
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
