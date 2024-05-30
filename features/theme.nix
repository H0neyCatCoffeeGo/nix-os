{ pkgs, config, ... }:

{

  gtk =
      let colors = config.colorScheme.colors;
        in {
    enable = true;

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3-dark";

    cursorTheme.package = pkgs.capitaine-cursors-themed;
    cursorTheme.name = "Capitaine Cursors (Gruvbox)";

    iconTheme.package = pkgs.zafiro-icons;
    iconTheme.name = "Zafiro-icons-Dark";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    gtk4.extraCss = ''
      @define-color accent_color #${colors.base0D};
      @define-color accent_bg_color mix(#${colors.base0D}, #${colors.base00},0.3);
      @define-color accent_fg_color #${colors.base05};
      @define-color destructive_color #${colors.base0D};
      @define-color destructive_bg_color mix(#${colors.base0D}, #${colors.base00},0.3);
      @define-color destructive_fg_color #${colors.base05};
      @define-color success_color #${colors.base0B};
      @define-color success_bg_color #${colors.base0E};
      @define-color success_fg_color #${colors.base05};
      @define-color warning_color #${colors.base0A};
      @define-color warning_bg_color #${colors.base00};
      @define-color warning_fg_color rgba(0, 0, 0, 0.8);
      @define-color error_color #${colors.base08};
      @define-color error_bg_color mix(#${colors.base0D}, #${colors.base00},0.3);
      @define-color error_fg_color #${colors.base05};
      @define-color window_bg_color #${colors.base00};
      @define-color window_fg_color #${colors.base05};
      @define-color view_bg_color #${colors.base02};
      @define-color view_fg_color #${colors.base05};
      @define-color headerbar_bg_color mix(#${colors.base00},black,0.2);
      @define-color headerbar_fg_color #${colors.base05};
      @define-color headerbar_border_color #${colors.base05};
      @define-color headerbar_backdrop_color @window_bg_color;
      @define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
      @define-color card_bg_color rgba(255, 255, 255, 0.08);
      @define-color card_fg_color #${colors.base05};
      @define-color card_shade_color rgba(0, 0, 0, 0.36);
      @define-color dialog_bg_color #${colors.base03};
      @define-color dialog_fg_color #${colors.base05};
      @define-color popover_bg_color #${colors.base03};
      @define-color popover_fg_color #${colors.base05};
      @define-color shade_color rgba(0,0,0,0.36);
      @define-color scrollbar_outline_color rgba(0,0,0,0.5);
      @define-color blue_1 #${colors.base0D};
      @define-color blue_2 #${colors.base0D};
      @define-color blue_3 #${colors.base0D};
      @define-color blue_4 #${colors.base0D};
      @define-color blue_5 #${colors.base0D};
      @define-color green_1 #${colors.base0B};
      @define-color green_2 #${colors.base0B};
      @define-color green_3 #${colors.base0B};
      @define-color green_4 #${colors.base0B};
      @define-color green_5 #${colors.base0B};
      @define-color yellow_1 #${colors.base0A};
      @define-color yellow_2 #${colors.base0A};
      @define-color yellow_3 #${colors.base0A};
      @define-color yellow_4 #${colors.base0A};
      @define-color yellow_5 #${colors.base0A};
      @define-color orange_1 #${colors.base09};
      @define-color orange_2 #${colors.base09};
      @define-color orange_3 #${colors.base09};
      @define-color orange_4 #${colors.base09};
      @define-color orange_5 #${colors.base09};
      @define-color red_1 #${colors.base08};
      @define-color red_2 #${colors.base08};
      @define-color red_3 #${colors.base08};
      @define-color red_4 #${colors.base08};
      @define-color red_5 #${colors.base08};
      @define-color purple_1 #${colors.base0E};
      @define-color purple_2 #${colors.base0E};
      @define-color purple_3 #${colors.base0E};
      @define-color purple_4 #${colors.base0E};
      @define-color purple_5 #${colors.base0E};
      @define-color brown_1 #${colors.base0F};
      @define-color brown_2 #${colors.base0F};
      @define-color brown_3 #${colors.base0F};
      @define-color brown_4 #${colors.base0F};
      @define-color brown_5 #${colors.base0F};
      @define-color light_1 #${colors.base05};
      @define-color light_2 #${colors.base05};
      @define-color light_3 #${colors.base05};
      @define-color light_4 #${colors.base05};
      @define-color light_5 #${colors.base05};
      @define-color dark_1 mix(#${colors.base00},white,0.5);
      @define-color dark_2 mix(#${colors.base00},white,0.2);
      @define-color dark_3 #${colors.base00};
      @define-color dark_4 mix(#${colors.base00},black,0.2);
      @define-color dark_5 mix(#${colors.base00},black,0.4);
    '';

  };

  qt = {
    enable = true;

    platformTheme = "gtk";
    style.name = "Adwaita-Dark";

  };

}
