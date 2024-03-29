{ pkgs, config, ... }:

{

  services.mako = with config.colorScheme.colors; {
    enable = true;
    font = "JetBrainsMono NF 11";
    width = 200;
    height = 100;
    icons = true;
    backgroundColor = "#${base00}";
    borderColor = "#${base0D}";
    borderSize = 2;
    textColor = "#${base05}";
    layer = "overlay";
    defaultTimeout = 5000;
  };

}
