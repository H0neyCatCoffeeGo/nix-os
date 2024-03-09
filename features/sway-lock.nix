{ pkgs, config, ... }:
{
  programs.swaylock = 
    let colors = config.colorScheme.colors;
    in {
    settings = {
      image = "~/.wallpaper/swiggle.jpg";
      color = "${colors.base00}";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "${colors.base06}";
      show-failed-attempts = true;
    };
  };
}
