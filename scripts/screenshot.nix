{ pkgs }:

pkgs.writeShellScriptBin "screenshot" ''
    grim -g "$(slurp)" - | ${pkgs.swappy}/bin/swappy -f - {pkgs.wl-clipboard}/bin/wl-copy -
''
