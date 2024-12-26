{pkgs}:
with pkgs; [
  # Nix LSP and Formatting
  nixd
  alejandra
  # General packages for development and system management
  gh
  btop
  zoxide
  eza
  # Node.js development tools
  nodejs
  pnpm
]
