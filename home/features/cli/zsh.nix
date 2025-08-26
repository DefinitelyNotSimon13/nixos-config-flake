{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.cli.zsh;
in
{
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
        size = 10000;
        share = true;
        append = true;
        extended = true;
        ignoreDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
      };

      historySubstringSearch = {
        enable = true;
      };

      sessionVariables = {
        ZOXIDE_CMD_OVERRIDE = "cd";
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "bold";
        EDITOR = "nvim";
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
        # lg = "lazygit";
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
        env = "git clone https://github.com/DefinitelyNotSimon13/direnv-flake . && ./init.sh";
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
        gl = ''git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'';
        gm = "git merge";
        gn = "git checkout -b"; # new branch
        gp = "git push";
        gr = "git reset";
        gs = "git status --short";
        gu = "git pull";
        view = "kitty +kitten icat";
        open = "xdg-open";
      };

      initContent = ''
                export ZSH_DISABLE_COMPFIX=true

                export EDITOR=nvim
                export MANPAGER="nvim +Man\!"

                export BUN_INSTALL="$HOME/.bun"
                export PATH="$BUN_INSTALL/bin:$PATH"
                export http_proxy=http://127.0.0.1:3128
                export https_proxy=$http_proxy
                export ftp_proxy=$http_proxy
                export all_proxy=$http_proxy
                export no_proxy='localhost,127.0.0.1,::1'

                export HTTP_PROXY=$http_proxy
                export HTTPS_PROXY=$https_proxy
                export FTP_PROXY=$ftp_proxy
                export ALL_PROXY=$all_proxy
                export NO_PROXY=$no_proxy

              if [ -n "$TTY" ]; then
                export GPG_TTY=$(tty)
              else
                export GPG_TTY="$TTY"
              fi

                path+=("$HOME/.bun/bin")
                path+=("$HOME/.config/rofi/bin")
                path+=("$HOME/.scripts/bin")
                path+=("$HOME/.bin")
                path+=("$HOME/.cargo/bin")
                path+=("$HOME/dotfiles/nixos/bin")
                path+=("$HOME/go/bin")
                path+=("$HOME/.ghcup/bin")

                alias -s md="bat"
                alias -s png="open"
                alias -s jpeg="open"
                alias -s jpg="open"
                alias -s mp4="open"
                alias -s json="jless"
                alias -s yaml="bat -l yaml"
                alias -s html="open"
                alias -s pdf="open"

                autoload -Uz edit-command-line
                zle -N edit-command-line
                bindkey '^Xe' edit-command-line

                copy-command() {
                  echo -n $BUFFER | wl-copy
                  zle -M "Copied to clipboard"
                }
                zle -N copy-command
                bindkey '^Xc' copy-command

                bindkey ' ' magic-space

                autoload -Uz zmv

                hash -d dl=$HOME/Downloads
                hash -d dot=$HOME/dotfiles
                hash -d nix=$HOME/dotfiles/nixos

                bindkey -s '^Xgc' 'git commit -m ""\C-b'

                bindkey -s '^Xgp' 'git push origin '
                bindkey -s '^Xgs' 'git status\n'
                bindkey -s '^Xgl' 'git log --oneline -n 10\n'
        	'';

      shellGlobalAliases = {
        NE = "2>/dev/null";
        ND = ">/dev/null";
        NUL = ">/dev/null 2>1";
        JQ = "| jq";
        C = "| wl-copy";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "colored-man-pages"
          "sudo"
          "git-auto-fetch"
          "man"
        ];
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
          name = "zsh-completions";
          src = pkgs.zsh-completions;
          file = "share/zsh-completions/zsh-completions.zsh";
        }
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
