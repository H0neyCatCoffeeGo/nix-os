{ pkgs, config, ... }:
{
  programs.swaylock = 
    let colors = config.colorScheme.colors;
    in {
    enable = true;
    settings = {
      image = "~/.wallpaper/pixelForest.png";
      font-size = 14;
      indicator-idle-visible = false;
      indicator-radius = 30;
      line-color = "${colors.base06}";
      color = "${colors.base00}";
      show-failed-attempts = true;
    };
  };
}
