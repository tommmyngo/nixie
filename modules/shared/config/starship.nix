{
  starship = {
    enable = true;
    settings = {
      format = "$all";
      right_format = "$cmd_duration";
      add_newline = true;
      scan_timeout = 10;
      character = {
        success_symbol = "[󰫢](green)";
        error_symbol = "[](red)";
      };
      line_break.disabled = true;
    };
  };
}
