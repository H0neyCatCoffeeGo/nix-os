{ pkgs, config, ... }:

{

  programs.rofi =
    let colors = config.colorScheme.colors;
    in {
      enable = true;
      font =   "JetBrainsMono Nerd Font 12";
      extraConfig = {

            bg0 =     "#${colors.base00}";
            bg1 =     "#${colors.base01}";
            fg0 =     "#${colors.base00}";

            accent-color =     "#${colors.base0D}";
            urgent-color =     "#${colors.base0D}";

            width = 12;

      };
    };
}
