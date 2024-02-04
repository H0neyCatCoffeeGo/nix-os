{ pkgs, config, ... }:

{
  programs.wofi =
    let colors = config.colorScheme.colors;
    in {
    enable = true;

    settings = {
      allow_markup = true;
      width = 400;
      height = 290;
      gtkk = false;
    };

    style = ''
      window {
        margin: 0px;
        font-family : JetBrainsMono Nerd Font;
	font-weight: bold;
        font-size : 15px;
        border: 1px solid #${colors.base00};
        background-color: #${colors.base00};
      }

      #input {
        margin: 5px;
        border: none;
        color: #${colors.base06};
        background-color: #${colors.base01};
      }


      #inner-box {
        margin: 5px;
        border: none;
        background-color: #${colors.base00};
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #${colors.base00};
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #${colors.base06};
      }

      #entry:unselected {
        border: none;
        color: #${colors.base0C};
        background-color: #${colors.base0C};
      }
      #entry:selected {
        border: none;
      }
      #entry:selected #text { 
        color: #${colors.base00}; 
        colors: #${colors.base0C};
        }
    '';
  };
}
