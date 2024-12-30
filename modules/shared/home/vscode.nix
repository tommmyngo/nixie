{pkgs, ...}: {
  programs = {
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
        ms-python.black-formatter

        # stivo.tailwind-fold
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
        "workbench.colorTheme" = "Horizon";
        "editor.fontFamily" = "GeistMono Nerd Font";
        "chat.commandCenter.enabled" = false;
        "git.autofetch" = true;

        # # Basically copied from Stylix theme extension on NixOS to share with MacOS - TODO: split this by system and let Stylix control NixOS themes
        # "workbench.colorCustomizations" = {
        #   "focusBorder" = "#df5273";
        #   "foreground" = "#ffe6e0";
        #   "disabledForeground" = "#edc4bb";
        #   "widget.border" = "#2e303e";
        #   "widget.shadow" = "#00000000";
        #   "selection.background" = "#2e303e";
        #   "descriptionForeground" = "#ffe6e099";
        #   "errorForeground" = "#e4a382";
        #   "icon.foreground" = "#ffe6e0";
        #   "textBlockQuote.background" = "#1b1c25";
        #   "textBlockQuote.border" = "#df5273";
        #   "textCodeBlock.background" = "#0b0c0f";
        #   "textLink.activeForeground" = "#24a8b4";
        #   "textLink.foreground" = "#df5273";
        #   "textPreformat.foreground" = "#df5273";
        #   "textSeparator.foreground" = "#ffe6e0";
        #   "toolbar.hoverBackground" = "#2e303e";
        #   "toolbar.activeBackground" = "#2e303e";
        #   "button.background" = "#df5273";
        #   "button.foreground" = "#0b0c0f";
        #   "button.hoverBackground" = "#df5273C0";
        #   "button.secondaryForeground" = "#0b0c0f";
        #   "button.secondaryBackground" = "#b072d1";
        #   "button.secondaryHoverBackground" = "#b072d1C0";
        #   "checkbox.background" = "#0b0c0f";
        #   "checkbox.foreground" = "#ffe6e0";
        #   "dropdown.background" = "#0b0c0f";
        #   "dropdown.listBackground" = "#0b0c0f";
        #   "dropdown.foreground" = "#ffe6e0";
        #   "input.background" = "#0b0c0f";
        #   "input.foreground" = "#ffe6e0";
        #   "input.placeholderForeground" = "#6f6f70";
        #   "inputOption.activeBackground" = "#df5273";
        #   "inputOption.activeForeground" = "#0b0c0f";
        #   "inputValidation.errorBackground" = "#e4a382";
        #   "inputValidation.errorForeground" = "#ffe6e0";
        #   "inputValidation.errorBorder" = "#e4a382";
        #   "inputValidation.infoBackground" = "#df5273";
        #   "inputValidation.infoForeground" = "#ffe6e0";
        #   "inputValidation.infoBorder" = "#df5273";
        #   "inputValidation.warningBackground" = "#b072d1";
        #   "inputValidation.warningForeground" = "#ffe6e0";
        #   "inputValidation.warningBorder" = "#b072d1";
        #   "scrollbar.shadow" = "#00000000";
        #   "scrollbarSlider.activeBackground" = "#edc4bb77";
        #   "scrollbarSlider.background" = "#6f6f7033";
        #   "scrollbarSlider.hoverBackground" = "#6f6f7077";
        #   "badge.foreground" = "#ffe6e0";
        #   "badge.background" = "#0b0c0f";
        #   "progressBar.background" = "#6f6f70";
        #   "list.activeSelectionBackground" = "#2e303e";
        #   "list.activeSelectionForeground" = "#ffe6e0";
        #   "list.dropBackground" = "#6f6f7066";
        #   "list.focusBackground" = "#2e303e";
        #   "list.focusForeground" = "#ffe6e0";
        #   "list.focusOutline" = "#df5273";
        #   "list.focusAndSelectionOutline" = "#df5273";
        #   "list.highlightForeground" = "#e3e6ee";
        #   "list.hoverBackground" = "#2e303e";
        #   "list.hoverForeground" = "#ffe6e0";
        #   "list.inactiveSelectionBackground" = "#2e303e";
        #   "list.inactiveSelectionForeground" = "#ffe6e0";
        #   "list.inactiveFocusBackground" = "#2e303e";
        #   "list.inactiveFocusOutline" = "#6f6f70";
        #   "list.invalidItemForeground" = "#e4a382";
        #   "list.errorForeground" = "#e4a382";
        #   "list.warningForeground" = "#b072d1";
        #   "listFilterWidget.background" = "#0b0c0f";
        #   "listFilterWidget.noMatchesOutline" = "#e4a382";
        #   "listFilterWidget.shadow" = "#00000000";
        #   "list.filterMatchBackground" = "#2e303e";
        #   "tree.indentGuidesStroke" = "#ffe6e0";
        #   "activityBar.background" = "#1b1c25";
        #   "activityBar.dropBorder" = "#6f6f70";
        #   "activityBar.foreground" = "#ffe6e0";
        #   "activityBar.inactiveForeground" = "#6f6f70";
        #   "activityBarBadge.background" = "#df5273";
        #   "activityBarBadge.foreground" = "#0b0c0f";
        #   "activityBar.activeBorder" = "#ffe6e0";
        #   "activityBar.activeBackground" = "#2e303e";
        #   "activityBar.activeFocusBorder" = "#df5273";
        #   "activityBarTop.foreground" = "#ffe6e0";
        #   "activityBarTop.activeBorder" = "#df5273";
        #   "activityBarTop.inactiveForeground" = "#6f6f70";
        #   "activityBarTop.dropBorder" = "#6f6f70";
        #   "profileBadge.background" = "#1b1c25";
        #   "profileBadge.foreground" = "#6f6f70";
        #   "sideBar.background" = "#1b1c25";
        #   "sideBar.foreground" = "#ffe6e0";
        #   "sideBar.dropBackground" = "#2e303e";
        #   "sideBarTitle.foreground" = "#ffe6e0";
        #   "sideBarSectionHeader.background" = "#1b1c25";
        #   "sideBarSectionHeader.foreground" = "#ffe6e0";
        #   "minimap.findMatchHighlight" = "#b072d1";
        #   "minimap.selectionHighlight" = "#2e303e";
        #   "minimap.errorHighlight" = "#e4a382";
        #   "minimap.warningHighlight" = "#b072d1";
        #   "minimap.background" = "#0b0c0f";
        #   "minimap.selectionOccurrenceHighlight" = "#6f6f70";
        #   "minimapGutter.addedBackground" = "#a4e990";
        #   "minimapGutter.modifiedBackground" = "#b072d1";
        #   "minimapGutter.deletedBackground" = "#e4a382";
        #   "editorGroup.dropBackground" = "#6f6f7066";
        #   "editorGroupHeader.noTabsBackground" = "#1b1c25";
        #   "editorGroupHeader.tabsBackground" = "#1b1c25";
        #   "editorGroup.emptyBackground" = "#0b0c0f";
        #   "editorGroup.focusedEmptyBorder" = "#df5273";
        #   "editorGroup.dropIntoPromptForeground" = "#dcdfe4";
        #   "editorGroup.dropIntoPromptBackground" = "#0b0c0f";
        #   "tab.activeBackground" = "#2e303e";
        #   "tab.unfocusedActiveBackground" = "#2e303e";
        #   "tab.activeForeground" = "#ffe6e0";
        #   "tab.border" = "#00000000";
        #   "tab.dragAndDropBorder" = "#6f6f70";
        #   "tab.inactiveBackground" = "#1b1c25";
        #   "tab.unfocusedInactiveBackground" = "#1b1c25";
        #   "tab.inactiveForeground" = "#ffe6e0";
        #   "tab.unfocusedActiveForeground" = "#edc4bb";
        #   "tab.unfocusedInactiveForeground" = "#edc4bb";
        #   "tab.hoverBackground" = "#2e303e";
        #   "tab.unfocusedHoverBackground" = "#2e303e";
        #   "tab.hoverForeground" = "#ffe6e0";
        #   "tab.unfocusedHoverForeground" = "#ffe6e0";
        #   "tab.activeModifiedBorder" = "#df5273";
        #   "tab.inactiveModifiedBorder" = "#df5273";
        #   "tab.unfocusedActiveModifiedBorder" = "#df5273";
        #   "tab.unfocusedInactiveModifiedBorder" = "#df5273";
        #   "editorPane.background" = "#0b0c0f";
        #   "editor.background" = "#0b0c0f";
        #   "editor.foreground" = "#ffe6e0";
        #   "editorLineNumber.foreground" = "#6f6f70";
        #   "editorLineNumber.activeForeground" = "#edc4bb";
        #   "editorCursor.foreground" = "#ffe6e0";
        #   "editor.selectionBackground" = "#2e303e";
        #   "editor.inactiveSelectionBackground" = "#2e303e";
        #   "editor.selectionHighlightBackground" = "#1b1c25";
        #   "editor.wordHighlightBackground" = "#2e303e";
        #   "editor.wordHighlightStrongBackground" = "#6f6f70";
        #   "editor.findMatchBackground" = "#b072d118";
        #   "editor.findMatchHighlightBackground" = "#b072d166";
        #   "editor.findRangeHighlightBackground" = "#1b1c25";
        #   "editor.findMatchBorder" = "#b072d1";
        #   "searchEditor.findMatchBackground" = "#b072d199";
        #   "editor.hoverHighlightBackground" = "#2e303e";
        #   "editor.lineHighlightBackground" = "#1b1c25";
        #   "editorLink.activeForeground" = "#df5273";
        #   "editor.rangeHighlightBackground" = "#1b1c25";
        #   "editorWhitespace.foreground" = "#6f6f70";
        #   "editorIndentGuide.background1" = "#2e303e";
        #   "editorIndentGuide.activeBackground1" = "#2e303e";
        #   "editorInlayHint.background" = "#1b1c25";
        #   "editorInlayHint.foreground" = "#6f6f70";
        #   "editorInlayHint.typeForeground" = "#6f6f70";
        #   "editorInlayHint.typeBackground" = "#1b1c25";
        #   "editorInlayHint.parameterForeground" = "#6f6f70";
        #   "editorInlayHint.parameterBackground" = "#1b1c25";
        #   "editorRuler.foreground" = "#2e303e";
        #   "editorCodeLens.foreground" = "#2e303e";
        #   "editorLightBulb.foreground" = "#b072d1";
        #   "editorLightBulbAutoFix.foreground" = "#df5273";
        #   "editorBracketMatch.background" = "#2e303e";
        #   "editorBracketHighlight.foreground1" = "#e4a382";
        #   "editorBracketHighlight.foreground2" = "#e57db1";
        #   "editorBracketHighlight.foreground3" = "#b072d1";
        #   "editorBracketHighlight.foreground4" = "#a4e990";
        #   "editorBracketHighlight.foreground5" = "#df5273";
        #   "editorBracketHighlight.foreground6" = "#b072d1";
        #   "editorBracketHighlight.unexpectedBracket.foreground" = "#c43131";
        #   "editorOverviewRuler.border" = "#00000000";
        #   "editorOverviewRuler.findMatchForeground" = "#b072d1";
        #   "editorOverviewRuler.rangeHighlightForeground" = "#6f6f70";
        #   "editorOverviewRuler.selectionHighlightForeground" = "#2e303e";
        #   "editorOverviewRuler.wordHighlightForeground" = "#e3e6ee";
        #   "editorOverviewRuler.wordHighlightStrongForeground" = "#df5273";
        #   "editorOverviewRuler.modifiedForeground" = "#b072d1";
        #   "editorOverviewRuler.addedForeground" = "#a4e990";
        #   "editorOverviewRuler.deletedForeground" = "#e4a382";
        #   "editorOverviewRuler.errorForeground" = "#e4a382";
        #   "editorOverviewRuler.warningForeground" = "#b072d1";
        #   "editorOverviewRuler.infoForeground" = "#24a8b4";
        #   "editorOverviewRuler.bracketMatchForeground" = "#dcdfe4";
        #   "editorError.foreground" = "#e4a382";
        #   "editorWarning.foreground" = "#b072d1";
        #   "editorInfo.foreground" = "#24a8b4";
        #   "editorHint.foreground" = "#df5273";
        #   "problemsErrorIcon.foreground" = "#e4a382";
        #   "problemsWarningIcon.foreground" = "#b072d1";
        #   "problemsInfoIcon.foreground" = "#24a8b4";
        #   "editorGutter.background" = "#0b0c0f";
        #   "editorGutter.modifiedBackground" = "#b072d1";
        #   "editorGutter.addedBackground" = "#a4e990";
        #   "editorGutter.deletedBackground" = "#e4a382";
        #   "editorGutter.commentRangeForeground" = "#edc4bb";
        #   "editorGutter.foldingControlForeground" = "#ffe6e0";
        #   "diffEditor.insertedTextBackground" = "#a4e9904c";
        #   "diffEditor.removedTextBackground" = "#e4a3824c";
        #   "diffEditor.border" = "#2e303e";
        #   "diffEditor.diagonalFill" = "#2e303e";
        #   "diffEditor.insertedLineBackground" = "#a4e99018";
        #   "diffEditor.removedLineBackground" = "#e4a38218";
        #   "diffEditorGutter.insertedLineBackground" = "#a4e99099";
        #   "diffEditorGutter.removedLineBackground" = "#e4a38299";
        #   "diffEditorOverview.insertedForeground" = "#a4e99099";
        #   "diffEditorOverview.removedForeground" = "#e4a38299";
        #   "diffEditor.unchangedRegionShadow" = "#00000000";
        #   "chat.requestBorder" = "#2e303e";
        #   "chat.requestBackground" = "#1b1c25";
        #   "chat.slashCommandBackground" = "#df5273";
        #   "chat.slashCommandForeground" = "#0b0c0f";
        #   "chat.avatarBackground" = "#df5273";
        #   "chat.avatarForeground" = "#0b0c0f";
        #   "inlineChat.background" = "#1b1c25";
        #   "inlineChat.border" = "#2e303e";
        #   "inlineChat.shadow" = "#00000000";
        #   "inlineChat.regionHighlight" = "#1b1c25";
        #   "inlineChatInput.border" = "#2e303e";
        #   "inlineChatInput.focusBorder" = "#df5273";
        #   "inlineChatInput.placeholderForeground" = "#6f6f70";
        #   "inlineChatInput.background" = "#0b0c0f";
        #   "inlineChatDiff.inserted" = "#a4e99060";
        #   "inlineChatDiff.removed" = "#e4a38260";
        #   "editorWidget.foreground" = "#ffe6e0";
        #   "editorWidget.background" = "#0b0c0f";
        #   "editorWidget.border" = "#2e303e";
        #   "editorWidget.resizeBorder" = "#df5273";
        #   "editorSuggestWidget.background" = "#1b1c25";
        #   "editorSuggestWidget.border" = "#2e303e";
        #   "editorSuggestWidget.foreground" = "#ffe6e0";
        #   "editorSuggestWidget.focusHighlightForeground" = "#df5273";
        #   "editorSuggestWidget.highlightForeground" = "#df5273";
        #   "editorSuggestWidget.selectedBackground" = "#2e303e";
        #   "editorSuggestWidget.selectedForeground" = "#ffe6e0";
        #   "editorSuggestWidget.selectedIconForeground" = "#ffe6e0";
        #   "editorHoverWidget.foreground" = "#ffe6e0";
        #   "editorHoverWidget.background" = "#1b1c25";
        #   "editorHoverWidget.border" = "#2e303e";
        #   "editorHoverWidget.highlightForeground" = "#df5273";
        #   "editorHoverWidget.statusBarBackground" = "#1b1c25";
        #   "editorGhostText.background" = "#00000000";
        #   "editorGhostText.foreground" = "#6f6f70";
        #   "editorStickyScroll.background" = "#0b0c0f";
        #   "editorStickyScroll.border" = "#2e303e";
        #   "editorStickyScroll.shadow" = "#00000000";
        #   "editorStickyScrollHover.background" = "#1b1c25";
        #   "debugExceptionWidget.background" = "#1b1c25";
        #   "editorMarkerNavigation.background" = "#1b1c25";
        #   "editorMarkerNavigationError.background" = "#e4a382";
        #   "editorMarkerNavigationWarning.background" = "#b072d1";
        #   "editorMarkerNavigationInfo.background" = "#df5273";
        #   "editorMarkerNavigationError.headerBackground" = "#e4a38220";
        #   "editorMarkerNavigationWarning.headerBackground" = "#b072d120";
        #   "editorMarkerNavigationInfo.headerBackground" = "#24a8b420";
        #   "peekViewEditor.background" = "#1b1c25";
        #   "peekViewEditorGutter.background" = "#1b1c25";
        #   "peekViewEditor.matchHighlightBackground" = "#e57db1";
        #   "peekViewResult.background" = "#0b0c0f";
        #   "peekViewResult.fileForeground" = "#ffe6e0";
        #   "peekViewResult.lineForeground" = "#6f6f70";
        #   "peekViewResult.matchHighlightBackground" = "#e57db1";
        #   "peekViewResult.selectionBackground" = "#2e303e";
        #   "peekViewResult.selectionForeground" = "#ffe6e0";
        #   "peekViewTitle.background" = "#2e303e";
        #   "peekViewTitleDescription.foreground" = "#6f6f70";
        #   "peekViewTitleLabel.foreground" = "#ffe6e0";
        #   "merge.currentHeaderBackground" = "#df527366";
        #   "merge.currentContentBackground" = "#df527318";
        #   "merge.incomingHeaderBackground" = "#a4e99066";
        #   "merge.incomingContentBackground" = "#a4e99018";
        #   "editorOverviewRuler.currentContentForeground" = "#df5273";
        #   "editorOverviewRuler.incomingContentForeground" = "#a4e990";
        #   "editorOverviewRuler.commonContentForeground" = "#c43131";
        #   "mergeEditor.conflict.unhandledFocused.border" = "#df5273";
        #   "mergeEditor.conflict.handledFocused.border" = "#df5273";
        #   "panel.background" = "#1b1c25";
        #   "panel.border" = "#00000000";
        #   "panel.dropBorder" = "#1b1c25";
        #   "panelTitle.activeForeground" = "#ffe6e0";
        #   "panelTitle.inactiveForeground" = "#6f6f70";
        #   "statusBar.background" = "#1b1c25";
        #   "statusBar.foreground" = "#ffe6e0";
        #   "statusBar.debuggingBackground" = "#e57db1";
        #   "statusBar.debuggingForeground" = "#0b0c0f";
        #   "statusBar.noFolderForeground" = "#ffe6e0";
        #   "statusBar.noFolderBackground" = "#1b1c25";
        #   "statusBarItem.activeBackground" = "#2e303e";
        #   "statusBarItem.hoverForeground" = "#ffe6e0";
        #   "statusBarItem.hoverBackground" = "#2e303e";
        #   "statusBarItem.prominentForeground" = "#0b0c0f";
        #   "statusBarItem.prominentBackground" = "#b072d1";
        #   "statusBarItem.prominentHoverForeground" = "#0b0c0f";
        #   "statusBarItem.prominentHoverBackground" = "#b072d1C0";
        #   "statusBarItem.remoteBackground" = "#1b1c25";
        #   "statusBarItem.remoteForeground" = "#ffe6e0";
        #   "statusBarItem.remoteHoverBackground" = "#2e303e";
        #   "statusBarItem.remoteHoverForeground" = "#ffe6e0";
        #   "statusBarItem.errorBackground" = "#e4a382";
        #   "statusBarItem.errorForeground" = "#0b0c0f";
        #   "statusBarItem.errorHoverBackground" = "#e4a382C0";
        #   "statusBarItem.errorHoverForeground" = "#0b0c0f";
        #   "statusBarItem.warningBackground" = "#b072d1";
        #   "statusBarItem.warningForeground" = "#0b0c0f";
        #   "statusBarItem.warningHoverBackground" = "#b072d1C0";
        #   "statusBarItem.warningHoverForeground" = "#0b0c0f";
        #   "statusBarItem.compactHoverBackground" = "#2e303e";
        #   "statusBarItem.focusBorder" = "#df5273";
        #   "statusBar.focusBorder" = "#df5273";
        #   "statusBarItem.offlineBackground" = "#e57db1";
        #   "statusBarItem.offlineForeground" = "#0b0c0f";
        #   "statusBarItem.offlineHoverForeground" = "#0b0c0f";
        #   "statusBarItem.offlineHoverBackground" = "#e57db1C0";
        #   "titleBar.activeBackground" = "#0b0c0f";
        #   "titleBar.activeForeground" = "#ffe6e0";
        #   "titleBar.inactiveBackground" = "#1b1c25";
        #   "titleBar.inactiveForeground" = "#6f6f70";
        #   "menubar.selectionForeground" = "#ffe6e0";
        #   "menubar.selectionBackground" = "#1b1c25";
        #   "menu.foreground" = "#ffe6e0";
        #   "menu.background" = "#1b1c25";
        #   "menu.selectionForeground" = "#ffe6e0";
        #   "menu.selectionBackground" = "#2e303e";
        #   "menu.separatorBackground" = "#2e303e";
        #   "menu.border" = "#2e303e";
        #   "commandCenter.foreground" = "#ffe6e0";
        #   "commandCenter.activeForeground" = "#e3e6ee";
        #   "commandCenter.background" = "#0b0c0f";
        #   "commandCenter.activeBackground" = "#1b1c25";
        #   "notificationCenterHeader.foreground" = "#ffe6e0";
        #   "notificationCenterHeader.background" = "#1b1c25";
        #   "notifications.foreground" = "#ffe6e0";
        #   "notifications.background" = "#2e303e";
        #   "notificationLink.foreground" = "#df5273";
        #   "notificationsErrorIcon.foreground" = "#e4a382";
        #   "notificationsWarningIcon.foreground" = "#b072d1";
        #   "notificationsInfoIcon.foreground" = "#df5273";
        #   "banner.background" = "#2e303e";
        #   "banner.foreground" = "#ffe6e0";
        #   "banner.iconForeground" = "#df5273";
        #   "extensionButton.prominentForeground" = "#0b0c0f";
        #   "extensionButton.prominentBackground" = "#a4e990";
        #   "extensionButton.prominentHoverBackground" = "#a4e990C0";
        #   "extensionButton.background" = "#df5273";
        #   "extensionButton.foreground" = "#0b0c0f";
        #   "extensionButton.hoverBackground" = "#df5273C0";
        #   "extensionButton.separator" = "#00000000";
        #   "extensionBadge.remoteBackground" = "#e57db1";
        #   "extensionBadge.remoteForeground" = "#e3e6ee";
        #   "extensionIcon.starForeground" = "#b072d1";
        #   "extensionIcon.verifiedForeground" = "#df5273";
        #   "extensionIcon.preReleaseForeground" = "#e57db1";
        #   "pickerGroup.border" = "#2e303e";
        #   "pickerGroup.foreground" = "#6f6f70";
        #   "quickInput.background" = "#1b1c25";
        #   "quickInput.foreground" = "#ffe6e0";
        #   "quickInputList.focusBackground" = "#2e303e";
        #   "quickInputList.focusForeground" = "#ffe6e0";
        #   "quickInputList.focusIconForeground" = "#ffe6e0";
        #   "quickInputTitle.background" = "#1b1c25";
        #   "keybindingLabel.background" = "#2e303e";
        #   "keybindingLabel.foreground" = "#ffe6e0";
        #   "keybindingLabel.bottomBorder" = "#2e303e";
        #   "keybindingTable.headerBackground" = "#2e303e";
        #   "keybindingTable.rowsBackground" = "#1b1c25";
        #   "terminal.background" = "#0b0c0f";
        #   "terminal.foreground" = "#ffe6e0";
        #   "terminal.ansiBlack" = "#0b0c0f";
        #   "terminal.ansiBlue" = "#df5273";
        #   "terminal.ansiBrightBlack" = "#6f6f70";
        #   "terminal.ansiBrightBlue" = "#df5273";
        #   "terminal.ansiBrightCyan" = "#24a8b4";
        #   "terminal.ansiBrightGreen" = "#a4e990";
        #   "terminal.ansiBrightMagenta" = "#b072d1";
        #   "terminal.ansiBrightRed" = "#e4a382";
        #   "terminal.ansiBrightWhite" = "#e3e6ee";
        #   "terminal.ansiBrightYellow" = "#b072d1";
        #   "terminal.ansiCyan" = "#24a8b4";
        #   "terminal.ansiGreen" = "#a4e990";
        #   "terminal.ansiMagenta" = "#b072d1";
        #   "terminal.ansiRed" = "#e4a382";
        #   "terminal.ansiWhite" = "#ffe6e0";
        #   "terminal.ansiYellow" = "#b072d1";
        #   "terminalCursor.foreground" = "#ffe6e0";
        #   "terminalOverviewRuler.cursorForeground" = "#ff0000";
        #   "terminalOverviewRuler.findMatchForeground" = "#ff0000";
        #   "debugToolBar.background" = "#1b1c25";
        #   "debugView.stateLabelForeground" = "#e3e6ee";
        #   "debugView.stateLabelBackground" = "#df5273";
        #   "debugView.valueChangedHighlight" = "#df5273";
        #   "debugTokenExpression.name" = "#b072d1";
        #   "debugTokenExpression.value" = "#ffe6e0";
        #   "debugTokenExpression.string" = "#a4e990";
        #   "debugTokenExpression.boolean" = "#e57db1";
        #   "debugTokenExpression.number" = "#e57db1";
        #   "debugTokenExpression.error" = "#e4a382";
        #   "testing.iconFailed" = "#e4a382";
        #   "testing.iconErrored" = "#c43131";
        #   "testing.iconPassed" = "#a4e990";
        #   "testing.runAction" = "#edc4bb";
        #   "testing.iconQueued" = "#b072d1";
        #   "testing.iconUnset" = "#edc4bb";
        #   "testing.iconSkipped" = "#b072d1";
        #   "testing.peekHeaderBackground" = "#1b1c25";
        #   "testing.message.error.decorationForeground" = "#ffe6e0";
        #   "testing.message.error.lineBackground" = "#e4a38220";
        #   "testing.message.info.decorationForeground" = "#ffe6e0";
        #   "testing.message.info.lineBackground" = "#df527320";
        #   "welcomePage.background" = "#0b0c0f";
        #   "welcomePage.progress.background" = "#6f6f70";
        #   "welcomePage.progress.foreground" = "#df5273";
        #   "welcomePage.tileBackground" = "#1b1c25";
        #   "welcomePage.tileHoverBackground" = "#2e303e";
        #   "walkThrough.embeddedEditorBackground" = "#0b0c0f";
        #   "gitDecoration.addedResourceForeground" = "#a4e990";
        #   "gitDecoration.modifiedResourceForeground" = "#b072d1";
        #   "gitDecoration.deletedResourceForeground" = "#e4a382";
        #   "gitDecoration.renamedResourceForeground" = "#24a8b4";
        #   "gitDecoration.stageModifiedResourceForeground" = "#b072d1";
        #   "gitDecoration.stageDeletedResourceForeground" = "#e4a382";
        #   "gitDecoration.untrackedResourceForeground" = "#e57db1";
        #   "gitDecoration.ignoredResourceForeground" = "#6f6f70";
        #   "gitDecoration.conflictingResourceForeground" = "#b072d1";
        #   "gitDecoration.submoduleResourceForeground" = "#c43131";
        #   "settings.headerForeground" = "#ffe6e0";
        #   "settings.modifiedItemIndicator" = "#df5273";
        #   "settings.dropdownBackground" = "#1b1c25";
        #   "settings.dropdownForeground" = "#ffe6e0";
        #   "settings.checkboxBackground" = "#1b1c25";
        #   "settings.checkboxForeground" = "#ffe6e0";
        #   "settings.rowHoverBackground" = "#2e303e";
        #   "settings.textInputBackground" = "#1b1c25";
        #   "settings.textInputForeground" = "#ffe6e0";
        #   "settings.numberInputBackground" = "#1b1c25";
        #   "settings.numberInputForeground" = "#ffe6e0";
        #   "settings.focusedRowBackground" = "#2e303e";
        #   "settings.focusedRowBorder" = "#df5273";
        #   "settings.headerBorder" = "#ffe6e0";
        #   "settings.sashBorder" = "#ffe6e0";
        #   "breadcrumb.foreground" = "#ffe6e0";
        #   "breadcrumb.background" = "#1b1c25";
        #   "breadcrumb.focusForeground" = "#dcdfe4";
        #   "breadcrumb.activeSelectionForeground" = "#e3e6ee";
        #   "breadcrumbPicker.background" = "#1b1c25";
        #   "editor.snippetTabstopHighlightBackground" = "#2e303e";
        #   "editor.snippetFinalTabstopHighlightBackground" = "#6f6f70";
        #   "symbolIcon.arrayForeground" = "#ffe6e0";
        #   "symbolIcon.booleanForeground" = "#e57db1";
        #   "symbolIcon.classForeground" = "#b072d1";
        #   "symbolIcon.colorForeground" = "#ffe6e0";
        #   "symbolIcon.constantForeground" = "#e57db1";
        #   "symbolIcon.constructorForeground" = "#df5273";
        #   "symbolIcon.enumeratorForeground" = "#e57db1";
        #   "symbolIcon.enumeratorMemberForeground" = "#df5273";
        #   "symbolIcon.eventForeground" = "#b072d1";
        #   "symbolIcon.fieldForeground" = "#e4a382";
        #   "symbolIcon.fileForeground" = "#ffe6e0";
        #   "symbolIcon.folderForeground" = "#ffe6e0";
        #   "symbolIcon.functionForeground" = "#df5273";
        #   "symbolIcon.interfaceForeground" = "#df5273";
        #   "symbolIcon.keyForeground" = "#ffe6e0";
        #   "symbolIcon.keywordForeground" = "#b072d1";
        #   "symbolIcon.methodForeground" = "#df5273";
        #   "symbolIcon.moduleForeground" = "#ffe6e0";
        #   "symbolIcon.namespaceForeground" = "#ffe6e0";
        #   "symbolIcon.nullForeground" = "#c43131";
        #   "symbolIcon.numberForeground" = "#e57db1";
        #   "symbolIcon.objectForeground" = "#ffe6e0";
        #   "symbolIcon.operatorForeground" = "#ffe6e0";
        #   "symbolIcon.packageForeground" = "#ffe6e0";
        #   "symbolIcon.propertyForeground" = "#ffe6e0";
        #   "symbolIcon.referenceForeground" = "#ffe6e0";
        #   "symbolIcon.snippetForeground" = "#ffe6e0";
        #   "symbolIcon.stringForeground" = "#a4e990";
        #   "symbolIcon.structForeground" = "#b072d1";
        #   "symbolIcon.textForeground" = "#ffe6e0";
        #   "symbolIcon.typeParameterForeground" = "#ffe6e0";
        #   "symbolIcon.unitForeground" = "#ffe6e0";
        #   "symbolIcon.variableForeground" = "#e4a382";
        #   "debugIcon.breakpointForeground" = "#e4a382";
        #   "debugIcon.breakpointDisabledForeground" = "#edc4bb";
        #   "debugIcon.breakpointUnverifiedForeground" = "#2e303e";
        #   "debugIcon.breakpointCurrentStackframeForeground" = "#b072d1";
        #   "debugIcon.breakpointStackframeForeground" = "#c43131";
        #   "debugIcon.startForeground" = "#a4e990";
        #   "debugIcon.pauseForeground" = "#df5273";
        #   "debugIcon.stopForeground" = "#e4a382";
        #   "debugIcon.disconnectForeground" = "#e4a382";
        #   "debugIcon.restartForeground" = "#a4e990";
        #   "debugIcon.stepOverForeground" = "#df5273";
        #   "debugIcon.stepIntoForeground" = "#24a8b4";
        #   "debugIcon.stepOutForeground" = "#b072d1";
        #   "debugIcon.continueForeground" = "#a4e990";
        #   "debugIcon.stepBackForeground" = "#c43131";
        #   "debugConsole.infoForeground" = "#ffe6e0";
        #   "debugConsole.warningForeground" = "#b072d1";
        #   "debugConsole.errorForeground" = "#e4a382";
        #   "debugConsole.sourceForeground" = "#ffe6e0";
        #   "debugConsoleInputIcon.foreground" = "#ffe6e0";
        #   "notebook.editorBackground" = "#0b0c0f";
        #   "notebook.cellBorderColor" = "#6f6f70";
        #   "notebook.cellHoverBackground" = "#1b1c25";
        #   "notebook.cellToolbarSeparator" = "#2e303e";
        #   "notebook.cellEditorBackground" = "#0b0c0f";
        #   "notebook.focusedCellBackground" = "#2e303e";
        #   "notebook.focusedCellBorder" = "#df5273";
        #   "notebook.focusedEditorBorder" = "#df5273";
        #   "notebook.inactiveFocusedCellBorder" = "#6f6f70";
        #   "notebook.selectedCellBackground" = "#2e303e";
        #   "notebookStatusErrorIcon.foreground" = "#e4a382";
        #   "notebookStatusRunningIcon.foreground" = "#24a8b4";
        #   "notebookStatusSuccessIcon.foreground" = "#a4e990";
        #   "charts.foreground" = "#ffe6e0";
        #   "charts.lines" = "#ffe6e0";
        #   "charts.red" = "#e4a382";
        #   "charts.blue" = "#df5273";
        #   "charts.yellow" = "#b072d1";
        #   "charts.orange" = "#e57db1";
        #   "charts.green" = "#a4e990";
        #   "charts.purple" = "#b072d1";
        #   "ports.iconRunningProcessForeground" = "#e57db1";
        # };
        # "editor.tokenColorCustomizations" = {
        #   "textMateRules" = [
        #     {
        #       "name" = "Comment";
        #       "scope" = [
        #         "comment"
        #         "punctuation.definition.comment"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#6f6f70";
        #       };
        #     }
        #     {
        #       "name" = "Variables; Parameters";
        #       "scope" = [
        #         "variable"
        #         "string constant.other.placeholder"
        #         "entity.name.variable.parameter"
        #         "entity.name.variable.local"
        #         "variable.parameter"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Properties";
        #       "scope" = [
        #         "variable.other.object.property"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Colors";
        #       "scope" = [
        #         "constant.other.color"
        #       ];
        #       "settings" = {
        #         "foreground" = "#a4e990";
        #       };
        #     }
        #     {
        #       "name" = "Invalid";
        #       "scope" = [
        #         "invalid"
        #         "invalid.illegal"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Invalid - Deprecated";
        #       "scope" = [
        #         "invalid.deprecated"
        #       ];
        #       "settings" = {
        #         "foreground" = "#c43131";
        #       };
        #     }
        #     {
        #       "name" = "Keyword; Storage";
        #       "scope" = [
        #         "keyword"
        #         "keyword.other"
        #         "keyword.other.using"
        #         "keyword.other.namespace"
        #         "keyword.other.class"
        #         "keyword.other.new"
        #         "keyword.other.event"
        #         "keyword.other.this"
        #         "keyword.other.await"
        #         "keyword.other.var"
        #         "keyword.other.package"
        #         "keyword.other.import"
        #         "variable.language.this"
        #         "storage.type.ts"
        #         "storage.modifier"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Keyword Control";
        #       "scope" = [
        #         "keyword.control"
        #         "keyword.control.flow"
        #         "keyword.control.from"
        #         "keyword.control.import"
        #         "keyword.control.as"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Types; Primitives";
        #       "scope" = [
        #         "keyword.type"
        #         "storage.type.primitive"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Function";
        #       "scope" = [
        #         "storage.type.function"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Operator; Misc";
        #       "scope" = [
        #         "constant.other.color"
        #         "punctuation"
        #         "punctuation.section.class.end"
        #         "meta.tag"
        #         "punctuation.definition.tag"
        #         "punctuation.separator.inheritance.php"
        #         "punctuation.definition.tag.html"
        #         "punctuation.definition.tag.begin.html"
        #         "punctuation.definition.tag.end.html"
        #         "keyword.other.template"
        #         "keyword.other.substitution"
        #       ];
        #       "settings" = {
        #         "foreground" = "#ffe6e0";
        #       };
        #     }
        #     {
        #       "name" = "Embedded";
        #       "scope" = [
        #         "punctuation.section.embedded"
        #         "variable.interpolation"
        #       ];
        #       "settings" = {
        #         "foreground" = "#c43131";
        #       };
        #     }
        #     {
        #       "name" = "Tag";
        #       "scope" = [
        #         "entity.name.tag"
        #         "meta.tag.sgml"
        #         "markup.deleted.git_gutter"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Function; Special Method";
        #       "scope" = [
        #         "entity.name.function"
        #         "meta.function-call"
        #         "variable.function"
        #         "support.function"
        #         "keyword.other.special-method"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Block Level Variables";
        #       "scope" = [
        #         "meta.block variable.other"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Other Variable; String Link";
        #       "scope" = [
        #         "support.other.variable"
        #         "string.other.link"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Number; Constant; Function Argument; Tag Attribute; Embedded";
        #       "scope" = [
        #         "constant.numeric"
        #         "constant.language"
        #         "support.constant"
        #         "constant.character"
        #         "constant.escape"
        #         "keyword.other.unit"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e57db1";
        #       };
        #     }
        #     {
        #       "name" = "String; Symbols; Inherited Class; Markup Heading";
        #       "scope" = [
        #         "string"
        #         "constant.other.symbol"
        #         "constant.other.key"
        #         "entity.other.inherited-class"
        #         "markup.heading"
        #         "markup.inserted.git_gutter"
        #         "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "";
        #         "foreground" = "#a4e990";
        #       };
        #     }
        #     {
        #       "name" = "Class; Support";
        #       "scope" = [
        #         "entity.name"
        #         "support.type"
        #         "support.class"
        #         "support.other.namespace.use.php"
        #         "meta.use.php"
        #         "support.other.namespace.php"
        #         "markup.changed.git_gutter"
        #         "support.type.sys-types"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Storage Type; Import Class";
        #       "scope" = [
        #         "storage.type"
        #         "storage.modifier.package"
        #         "storage.modifier.import"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Fields";
        #       "scope" = [
        #         "entity.name.variable.field"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Entity Types";
        #       "scope" = [
        #         "support.type"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "CSS Class and Support";
        #       "scope" = [
        #         "source.css support.type.property-name"
        #         "source.sass support.type.property-name"
        #         "source.scss support.type.property-name"
        #         "source.less support.type.property-name"
        #         "source.stylus support.type.property-name"
        #         "source.postcss support.type.property-name"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Sub-methods";
        #       "scope" = [
        #         "entity.name.module.js"
        #         "variable.import.parameter.js"
        #         "variable.other.class.js"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Language methods";
        #       "scope" = [
        #         "variable.language"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "entity.name.method.js";
        #       "scope" = [
        #         "entity.name.method.js"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "meta.method.js";
        #       "scope" = [
        #         "meta.class-method.js entity.name.function.js"
        #         "variable.function.constructor"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Attributes";
        #       "scope" = [
        #         "entity.other.attribute-name"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "HTML Attributes";
        #       "scope" = [
        #         "text.html.basic entity.other.attribute-name.html"
        #         "text.html.basic entity.other.attribute-name"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "CSS Classes";
        #       "scope" = [
        #         "entity.other.attribute-name.class"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "CSS ID's";
        #       "scope" = [
        #         "source.sass keyword.control"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Inserted";
        #       "scope" = [
        #         "markup.inserted"
        #       ];
        #       "settings" = {
        #         "foreground" = "#a4e990";
        #       };
        #     }
        #     {
        #       "name" = "Deleted";
        #       "scope" = [
        #         "markup.deleted"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Changed";
        #       "scope" = [
        #         "markup.changed"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Regular Expressions";
        #       "scope" = [
        #         "string.regexp"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Escape Characters";
        #       "scope" = [
        #         "constant.character.escape"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "URL";
        #       "scope" = [
        #         "*url*"
        #         "*link*"
        #         "*uri*"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "underline";
        #       };
        #     }
        #     {
        #       "name" = "Decorators";
        #       "scope" = [
        #         "tag.decorator.js entity.name.tag.js"
        #         "tag.decorator.js punctuation.definition.tag.js"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "ES7 Bind Operator";
        #       "scope" = [
        #         "source.js constant.other.object.key.js string.unquoted.label.js"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 0";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 1";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 2";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 3";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 4";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 5";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 6";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 7";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "JSON Key - Level 8";
        #       "scope" = [
        #         "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Plain";
        #       "scope" = [
        #         "text.html.markdown"
        #         "punctuation.definition.list_item.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#ffe6e0";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Markup Raw Inline";
        #       "scope" = [
        #         "text.html.markdown markup.inline.raw.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Markup Raw Inline Punctuation";
        #       "scope" = [
        #         "text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Line Break";
        #       "scope" = [
        #         "text.html.markdown meta.dummy.line-break"
        #       ];
        #       "settings" = {
        #         "foreground" = "#6f6f70";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Heading";
        #       "scope" = [
        #         "markdown.heading"
        #         "markup.heading | markup.heading entity.name"
        #         "markup.heading.markdown punctuation.definition.heading.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Italic";
        #       "scope" = [
        #         "markup.italic"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Bold";
        #       "scope" = [
        #         "markup.bold"
        #         "markup.bold string"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "bold";
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Bold-Italic";
        #       "scope" = [
        #         "markup.bold markup.italic"
        #         "markup.italic markup.bold"
        #         "markup.quote markup.bold"
        #         "markup.bold markup.italic string"
        #         "markup.italic markup.bold string"
        #         "markup.quote markup.bold string"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "bold";
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Underline";
        #       "scope" = [
        #         "markup.underline"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "underline";
        #         "foreground" = "#e57db1";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Blockquote";
        #       "scope" = [
        #         "markup.quote punctuation.definition.blockquote.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Quote";
        #       "scope" = [
        #         "markup.quote"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "italic";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Link";
        #       "scope" = [
        #         "string.other.link.title.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Link Description";
        #       "scope" = [
        #         "string.other.link.description.title.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Link Anchor";
        #       "scope" = [
        #         "constant.other.reference.link.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Raw Block";
        #       "scope" = [
        #         "markup.raw.block"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Raw Block Fenced";
        #       "scope" = [
        #         "markup.raw.block.fenced.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#00000050";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Fenced Bode Block";
        #       "scope" = [
        #         "punctuation.definition.fenced.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#00000050";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Fenced Code Block Variable";
        #       "scope" = [
        #         "markup.raw.block.fenced.markdown"
        #         "variable.language.fenced.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Fenced Language";
        #       "scope" = [
        #         "variable.language.fenced.markdown"
        #       ];
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "name" = "Markdown - Separator";
        #       "scope" = [
        #         "meta.separator"
        #       ];
        #       "settings" = {
        #         "fontStyle" = "bold";
        #         "foreground" = "#24a8b4";
        #       };
        #     }
        #     {
        #       "name" = "Markup - Table";
        #       "scope" = [
        #         "markup.table"
        #       ];
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "scope" = "token.info-token";
        #       "settings" = {
        #         "foreground" = "#df5273";
        #       };
        #     }
        #     {
        #       "scope" = "token.warn-token";
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #     {
        #       "scope" = "token.error-token";
        #       "settings" = {
        #         "foreground" = "#e4a382";
        #       };
        #     }
        #     {
        #       "scope" = "token.debug-token";
        #       "settings" = {
        #         "foreground" = "#b072d1";
        #       };
        #     }
        #   ];
        # };
      };
    };
  };
}
