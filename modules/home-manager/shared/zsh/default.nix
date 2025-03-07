{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(micromamba shell hook --shell zsh)"

      function v() {
          if [ "$#" -ne 0 ]; then
              if [ -f "$1" ]; then
                  cd "$(dirname "$1")" || return
              else
                  cd "$1" || return
              fi
          fi
          
          # Get the current directory name
          local env_name="$(basename "$PWD")"
          
          # Check if a micromamba environment with this name exists
          if micromamba env list | awk 'NR>2 {print $1}' | grep -qx "$env_name"; then
              echo "Activating Micromamba environment: $env_name"
              micromamba activate "$env_name"
          else
              echo "No matching Micromamba environment found for: $env_name"
          fi
          
          nvim
      }

      export PEREC_DIR="/Users/simon/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"
    '';
  };
}
