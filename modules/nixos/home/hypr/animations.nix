{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      # first_launch_animation = true;
      animation = [
        "windowsIn,1,5,default,popin 0%"
        "windowsOut,1,5,default,popin"
        "windowsMove,1,5,default,slide"
        "layersIn,1,4,default,slide"
        "layersOut,1,4,default,slide"
        "fadeIn,1,8,default"
        "fadeOut,1,8,default"
        "fadeSwitch,1,8,default"
        "fadeShadow,1,8,default"
        "fadeDim,1,8,default"
        "fadeLayersIn,1,8,default"
        "fadeLayersOut,1,8,default"
        "border,1,20,default"
        "borderangle,1,20,default,once"
        "workspaces, 1,5,default,slide"
        "specialWorkspace,1,5,default,fade"
      ];
    };
  };
}
