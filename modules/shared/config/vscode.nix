{pkgs, ...}: {
  vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      aaron-bond.better-comments
      naumovs.color-highlight
      dbaeumer.vscode-eslint
      tamasfe.even-better-toml
      github.copilot
      github.copilot-chat
      eamodio.gitlens
      ecmel.vscode-html-css
      oderwat.indent-rainbow
      pkief.material-icon-theme
      jnoortheen.nix-ide
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
      yoavbls.pretty-ts-errors
      bradlc.vscode-tailwindcss
      gruntfuggly.todo-tree
      bradgashler.htmltagwrap
      jock.svg
      # fractalbrew.backticks
      # mrmlnc.vscode-scss
      # ms-vscode.vscode-typescript-next
      # chakrounanas.turbo-console-log
      # dsznajder.es7-react-js-snippets
    ];
    userSettings = {
      "files.exclude" = {
        "**/.cache" = false;
        "**/.classpath" = true;
        "**/.DS_Store" = true;
        "**/.factorypath" = true;
        "**/.git" = true;
        "**/.hg" = true;
        "**/.next" = true;
        "**/.project" = true;
        "**/.settings" = false;
        "**/.svn" = true;
        "**/coverage" = true;
        "**/CVS" = true;
        "**/reports" = true;
        "**/security_log" = false;
        "**/tmp" = true;
        "**/dist" = false;
        "**/node_modules" = false;
        "**/.wrangler" = true;
        "**/.partykit" = true;
        "**/.vercel" = true;
        "**/.husky" = false;
        "**/.open-next" = true;
        "**/.sst" = false;
        "**/@girs" = true;
      };
      "files.watcherExclude" = {
        "**/.git/**" = true;
        "**/coverage/**" = true;
        "**/dist/**" = false;
        "**/node_modules/**" = false;
        "**/reports/**" = true;
        "**/tmp/**" = true;
      };
      "editor.accessibilitySupport" = "off";
      "terminal.integrated.fontFamily" = "GeistMono Nerd Font";
      "editor.fontLigatures" = true;
      "workbench.startupEditor" = "none";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "security.workspace.trust.untrustedFiles" = "open";
      "tailwind-fold.autoFold" = false;
      "git.confirmSync" = true;
      "turboConsoleLog.includeFileNameAndLineNum" = false;
      "turboConsoleLog.insertEnclosingFunction" = false;
      "turboConsoleLog.insertEnclosingClass" = false;
      "htmltagwrap.tag" = "div";
      "editor.inlineSuggest.enabled" = true;
      "gitlens.gitCommands.skipConfirmations" = ["fetch=command" "switch=command"];
      "redhat.telemetry.enabled" = false;
      "css.lint.unknownAtRules" = "ignore";
      "files.saveConflictResolution" = "overwriteFileOnDisk";
      "explorer.confirmPasteNative" = false;
      "explorer.compactFolders" = false;
      "git.openRepositoryInParentFolders" = "never";
      "editor.tabSize" = 2;
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      # JS/TS
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "javascript.validate.enable" = false;
      "javascript.preferences.quoteStyle" = "double";
      "typescript.preferences.quoteStyle" = "double";
      "typescript.enablePromptUseWorkspaceTsdk" = true;
      "typescript.tsdk" = "node_modules/typescript/lib";
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # PYTHON
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
      "[scss]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # GO
      "go.formatTool" = "goimports";
      # NIX
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = ["alejandra"];
          };
        };
      };
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Celestial";
      "editor.fontFamily" = "GeistMono Nerd Font";
      "chat.commandCenter.enabled" = false;
    };
  };
}
