{ pkgs, config, ... }: {

  gtk = {
    enable = true;

    theme.name = "Gruvbox-Dark-BL-LB";
    iconTheme.name = "Papirus-Dark";
    cursorTheme.name = "Capitaine Cursors";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  qt = {
    enable = true;

    platformTheme = "gtk";
    style.name = "Gruvbox-Dark-BL-LB";

  };

}
