{ pkgs, config, ... }:

  let
    gruvboxPlus = import ./gtkGruvbox.nix { inherit pkgs; };
  in
  {
  gtk = {
    enable = true;

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";

    cursorTheme.package = pkgs.capitaine-cursors-themed;
    cursorTheme.name = "Capitaine Cursors (Gruvbox)";

    iconTheme.package = gruvboxPlus;
    iconTheme.name = "GruvboxPlus";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  qt = {
    enable = true;

    platformTheme = "gtk";
    style.name = "adwita-dark";

  };

}
