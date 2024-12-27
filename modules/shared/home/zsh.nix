{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = false;
    plugins = [
    ];
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      ##NIX##
      nrs = "nix run $HOME/nixie#build-switch";
      nrb = "nix run $HOME/nixie#build";
      ##UTILS##
      ls = "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
      cd = "z";
      clc = "clear";
      ##NODE##
      pn = "pnpm";
      ##GIT##
      gl = "git log --oneline";
      gaa = "git add .";
      gcm = "git commit -m";
      gps = "git push";
      gpl = "git pull";
      gf = "git fetch";
      grb = "git rebase";
      gmm = "git merge main";
      gcma = "gaa ; gcm";
      gchm = "gch main ; gpl";
      gchb = "gch -b";
      gcpa = "f() {gaa ; gcm $1 ; gps};f";
      gch = "git checkout";

      ##FUN##
      bonsai = "cbonsai -ilL 50";
      snowtree = "snowmachine tree --snow-speed 20";
    };

    initExtraFirst = ''
      # Define variables for directories
      export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
      export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
      export PATH=$HOME/.local/share/bin:$PATH

      # Remove history data we don't want to see
      export HISTIGNORE="pwd:ls:cd"

      export EDITOR="code"
      export BROWSER="google-chrome-stable"

      # nix shortcuts
      shell() {
          nix-shell '<nixpkgs>' -A "$1"
      }

      # Use difftastic, syntax-aware diffing
      alias diff=difft

      eval "$(zoxide init zsh)"

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi
    '';
  };
}
