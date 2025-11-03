{ pkgs, lib, config, ... }:
with lib;
let cfg = config.features.cli.zsh;
in {
  options.features.cli.zsh = {
    enable = mkEnableOption "enables extended zsh configuration";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      autocd = true;

      history = {
        share = true;
        append = true;
        extended = true;
        ignoreDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
      };

      historySubstringSearch = { enable = true; };

      sessionVariables = {
        ZOXIDE_CMD_OVERRIDE = "cd";
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "bold";
      };

      shellAliases = {
        vim = "nvim";
        vi = "nvim";
        t = "tmux";
        te = "mux kill-session && exit";
        ls = "eza --icons --group-directories-first";
        ll = "eza --long --git --icons --group-directories-first";
        tree = "eza --tree --icons --group-directories-first";
        la = "eza --all --icons --group-directories-first";
        lla = "eza --long --all --icons --group-directories-first";
        cat = "bat";
        zz = "cd -";
        lg = "lazygit";
        ":q" = "exit";
        cl = "clear";
        c = "clear";
        n = "nvim";
        tx = "tmuxinator";
        killme = "shutdown now";
        uvenv = "source .venv/bin/activate";
        neorg = ''nvim -c "Neorg workspace notes"'';
        z = "zathura";
        grep = "rg";
        find = "fd";
        env =
          "git clone https://github.com/DefinitelyNotSimon13/direnv-flake . && ./init.sh";
        ga = "git add";
        gap = "ga --patch";
        gb = "git branch";
        gba = "gb --all";
        gc = "git commit";
        gca = "gc --amend --no-edit";
        gce = "gc --amend";
        gco = "git checkout";
        gcl = "git clone --recursive";
        gd = ''git diff --output-indicator-new=" " --output-indicator-old=" "'';
        gds = "gd --staged";
        gi = "git init";
        gl = ''
          git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'';
        gm = "git merge";
        gn = "git checkout -b"; # new branch
        gp = "git push";
        gr = "git reset";
        gs = "git status --short";
        gu = "git pull";
        view = "kitty +kitten icat";
      };

      initContent = ''
        export ZSH_DISABLE_COMPFIX=true

        export EDITOR=nvim

        export BUN_INSTALL="$HOME/.bun"
        export PATH="$BUN_INSTALL/bin:$PATH"


        path+=("$HOME/.config/rofi/bin")
        path+=("$HOME/.scripts/bin")
        path+=("$HOME/.bin")
        path+=("$HOME/.cargo/bin")
        path+=("$HOME/dotfiles/nixos/bin")
        path+=("$HOME/go/bin")
        path+=("$HOME/.ghcup/bin")
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [ "colored-man-pages" "sudo" "git-auto-fetch" "man" ];
        extraConfig = ''
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
          zstyle ':completion:*' list-colors "$\{(s.:.)LS_COLORS}"
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --group-directories-first $realpath'
          zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons --group-directories-first $realpath'
        '';
      };

      plugins = [
        {
          name = "zsh-autopair";
          src = pkgs.fetchFromGitHub {
            owner = "hlissner";
            repo = "zsh-autopair";
            rev = "449a7c3d095bc8f3d78cf37b9549f8bb4c383f3d";
            sha256 = "3zvOgIi+q7+sTXrT+r/4v98qjeiEL4Wh64rxBYnwJvQ=";
          };
        }
        {
          name = "fzf-tab";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "b6e1b22458a131f835c6fe65bdb88eb45093d2d2";
            sha256 = "4A7zpaO1rNPvS0rrmmxg56rJGpZHnw/g+x5FJd0EshI=";
          };
        }
        {
          name = "zsh-wakatime";
          src = pkgs.fetchFromGitHub {
            owner = "wbingli";
            repo = "zsh-wakatime";
            rev = "e0d1dfcaaab11112344e14b826f3136edac4eccc";
            sha256 = "QN/MUDm+hVJUMA4PDqs0zn9XC2wQZrgQr4zmCF0Vruk=";
          };
        }
        {
          name = "zsh-vi-mode";
          src = pkgs.fetchFromGitHub {
            owner = "jeffreytse";
            repo = "zsh-vi-mode";
            rev = "cd730cd347dcc0d8ce1697f67714a90f07da26ed";
            sha256 = "UQo9shimLaLp68U3EcsjcxokJHOTGhOjDw4XDx6ggF4=";
          };
        }
      ];

    };

  };
}
