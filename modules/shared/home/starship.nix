{
  programs = {
    starship = {
      enable = true;
      settings = {
        format = "$directory$git_branch$git_status$status$line_break$character";
        right_format = "$cmd_duration";
        add_newline = true;
        scan_timeout = 10;
        line_break.disabled = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[](bold red)";
        };
        directory = {
          truncation_length = 5;
        };
        git_status = {
          conflicted = "🏳";
          ahead = "🏎💨";
          behind = "😰";
          diverged = "😵";
          up_to_date = "";
          untracked = "🤷";
          stashed = "📦";
          modified = "📝";
          staged = "[++\($count\)](green)";
          renamed = "👅";
          deleted = "🗑";
        };
      };
    };
  };
}
