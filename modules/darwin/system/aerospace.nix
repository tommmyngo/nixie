{
  services.aerospace = {
    enable = true;
    settings = {
      gaps = {
        inner.horizontal = 6;
        inner.vertical = 6;
        outer.left = 4;
        outer.bottom = 2;
        outer.top = 2;
        outer.right = 4;
      };
      # TODO: Add resizing bindings - update linux bindings to somehwat match
      mode.main.binding = {
        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        alt-slash = "layout tiles horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-a = "workspace prev --wrap-around";
        alt-d = "workspace next --wrap-around";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-a = "move-node-to-workspace prev --wrap-around";
        alt-shift-d = "move-node-to-workspace next --wrap-around";
      };
    };
  };
}
