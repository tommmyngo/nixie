let
  name = "Tommy Ngo";
  email = "tommyhoaingo@gmail.com";
in {
  programs = {
    git = {
      enable = true;
      userName = name;
      userEmail = email;
      lfs = {
        enable = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };
    };
  };
}
