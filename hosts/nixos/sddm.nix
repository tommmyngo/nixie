{pkgs, ...}:
pkgs.where-is-my-sddm-theme.override {
  themeConfig = {
    General = {
      passwordCharacter = "";
      passwordMask = true;
      passwordInputWidth = 0.5;
      passwordInputBackground = "#110f0f";
      passwordInputRadius = 24;
      passwordInputCursorVisible = true;
      passwordFontSize = 100;

      showSessionsByDefault = true;
      sessionsFontSize = 36;

      showUsersByDefault = true;
      usersFontSize = 48;

      basicTextColor = "#E3E6EE";

      font = "GeistMono Nerd Font";
    };
  };
  variants = ["qt5"];
}
