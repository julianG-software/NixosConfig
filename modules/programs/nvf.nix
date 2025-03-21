{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
  ];

  options = {
    # Option declarations.
    # Declare what settings a user of this module can set.
    # Usually this includes a global "enable" option which defaults to false.

    nvf.enable = lib.mkEnableOption "enables nvf module";
  };

  config = lib.mkIf config.nvf.enable {
    # Option definitions.
    # Define what other settings, services and resources should be active.
    # Usually these depend on whether a user of this module chose to "enable" it
    # using the "option" above.
    # Options for modules imported in "imports" can be set here.
    # NVF
    programs.nvf = {
      enable = true;
      settings = {
        vim = {

          # Visuals

          theme = {
            enable = true;
            name = "catppuccin";
            style = "frappe";
            transparent = false;
          };

          statusline = {
            lualine = {
              enable = true;
              theme = "catppuccin";
            };
          };

          visuals = {
            nvim-scrollbar.enable = true;
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;
            cinnamon-nvim.enable = false; # Smooth scrolling for ANY command
            fidget-nvim.enable = true; # Extensible UI for Neovim notifications and LSP progress messages.

            highlight-undo.enable = true; # Highlight changed text after any action not in insert mode which modifies the current buffer
            indent-blankline.enable = true; # This plugin adds indentation guides to Neovim.
          };

          # Functionality
          lsp = {
            formatOnSave = true;
            lspkind.enable = true; # vscode-like pictograms
            lightbulb.enable = true; # adds a lightbulb to areas where code actions are available
            lspsaga.enable = false; # IDK what lspsaga does
            trouble.enable = false; # list showing showing diagnostics, references, telescope results, quickfix and location lists
            lspSignature.enable = true; # Show function signature when you type

            otter-nvim.enable = false; # provides lsp features and a code completion source for code embedded in other documents
            lsplines.enable = false; # repo is archived
          };

          languages = {

            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true; # syntax highlighting
            enableExtraDiagnostics = true;

            # Languages enable as needed
            nix = {
              enable = true;
              # can prob uninstall nixfmt by using format.package
              format.type = "nixfmt";
            };

            # General
            markdown.enable = true;
            yaml.enable = true;
            bash.enable = true;

            # Web Dev
            html.enable = false;
            css.enable = false;
            ts.enable = false;
            tailwind.enable = false;
            # IDK what js is or if its even needed
            # Same with react

            # Others
            sql.enable = false;
            python.enable = false;
            lua.enable = false;
            elixir.enable = false;

          };

          autopairs.nvim-autopairs.enable = true;
          autocomplete.nvim-cmp.enable = true;
          snippets.luasnip.enable = false;

          filetree = {
            neo-tree = {
              enable = true; # plugin to browse the file system and other tree like structures in whatever style suits you
            };
          };

          tabline = {
            nvimBufferline.enable = false; # adds file tabs like in gui editors
          };

          treesitter.context.enable = true;

          # Learn Vim
          binds = {
            whichKey.enable = false; # Help Learning ur keybinds
            cheatsheet.enable = false; # searchable vim cheatsheet
          };

          telescope.enable = true; # Most Popular Fuzzy Finder

          git = {
            enable = true;
            gitsigns.enable = true; # Deep buffer integration for Git
            gitsigns.codeActions.enable = false; # throws an annoying debug message
          };

          minimap = {
            minimap-vim.enable = false;
            codewindow.enable = false; # lighter, faster, and uses lua for configuration
          };

          dashboard = {
            dashboard-nvim.enable = false;
            alpha.enable = false;
          };

          notify = {
            nvim-notify.enable = true;
          };

          projects = {
            project-nvim.enable = true;
          };

          utility = {
            diffview-nvim.enable = false; # Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
            yanky-nvim.enable = false; # improve yank and put functionalities for Neovim.
            icon-picker.enable = false; # plugin that helps you pick 𝑨𝕃𝚻 Font Characters, Symbols Σ, Nerd Font Icons  & Emojis ✨
            surround.enable = false; # Add/change/delete surrounding delimiter pairs with ease.
            multicursors.enable = false;

            # Lear Later
            motion = {
              hop.enable = false;
              leap.enable = false;
              precognition.enable = false;
            };

          };

          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
            };
          };

          ui = {
            borders.enable = true;
            noice.enable = true;
            colorizer.enable = true;
            modes-nvim.enable = false; # the theme looks terrible with catppuccin
            illuminate.enable = true;
            breadcrumbs = {
              enable = true;
              navbuddy.enable = true;
            };
            smartcolumn = {
              enable = true;
              setupOpts.custom_colorcolumn = {
                # this is a freeform module, it's `buftype = int;` for configuring column position
                nix = "110";
                ruby = "120";
                java = "130";
                go = [
                  "90"
                  "130"
                ];
              };
            };
            fastaction.enable = true;
          };

          assistant = {
            chatgpt.enable = false;
            copilot = {
              enable = false;
              cmp.enable = false;
            };
            codecompanion-nvim.enable = false;
          };

          session = {
            nvim-session-manager.enable = false;
          };

          comments = {
            comment-nvim.enable = true;
          };

        };
      };
    };
  };
}
