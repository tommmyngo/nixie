{
  services.aerospace = {
    enable = true;
    settings = {
      enable-normalization-flatten-containers = false;
      enable-normalization-opposite-orientation-for-nested-containers = false;
      on-focus-changed = [
        "move-mouse window-lazy-center"
      ];

      gaps = {
        inner.horizontal = 6;
        inner.vertical = 6;
        outer.left = 4;
        outer.bottom = 2;
        outer.top = 2;
        outer.right = 4;
      };
      # All possible keys:
      # - Letters.        a, b, c, ..., z
      # - Numbers.        0, 1, 2, ..., 9
      # - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
      # - F-keys.         f1, f2, ..., f20
      # - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
      #                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
      # - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
      #                   keypadMinus, keypadMultiply, keypadPlus
      # - Arrows.         left, down, up, right

      # All possible modifiers: cmd, alt, ctrl, shift
      mode.main.binding = {
        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        alt-space = "layout tiling floating";

        # Moving windows within layout - Vim
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # Switching Workspaces and moving to Workspaces
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        # alt-5 = "workspace 5";
        # alt-6 = "workspace 6";
        # alt-7 = "workspace 7";
        # alt-8 = "workspace 8";
        alt-a = "workspace prev --wrap-around";
        alt-d = "workspace next --wrap-around";
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        # alt-shift-5 = "move-node-to-workspace 5";
        # alt-shift-6 = "move-node-to-workspace 6";
        # alt-shift-7 = "move-node-to-workspace 7";
        # alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-a = "move-node-to-workspace prev --wrap-around";
        alt-shift-d = "move-node-to-workspace next --wrap-around";

        alt-ctrl-left = "resize smart -50";
        alt-ctrl-right = "resize smart +50";
      };
    };
  };
}
