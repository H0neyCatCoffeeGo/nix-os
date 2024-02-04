{ lib, pkgs, config, options, ... }:

with lib;
with pkgs;
let
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  font = "Roboto";
  colors = config.colorScheme.colors;
  monospaced = text: ''<span font_family="RobotoMono">'' + text + "</span>";
in
{

  home.packages = with pkgs; [
    wl-clipboard
    wlr-randr
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    XKB_DEFAULT_OPTIONS = "terminate:ctrl_alt_bksp,caps:escape,altwin:swap_alt_win";
    SDL_VIDEODRIVER = "wayland";

    # needs qt5.qtwayland in systemPackages
    QT_QPA_PLATFORM="wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION="1";

    # Fix for some Java AWT applications (e.g. Android Studio),
    # use this if they aren't displayed properly:
    _JAVA_AWT_WM_NONREPARENTING=1;

    # gtk applications on wayland
    # export GDK_BACKEND=wayland
  };
wayland.windowManager.sway = {

    extraSessionCommands = ''
      unset __NIXOS_SET_ENVIRONMENT_DONE
    '';

    extraConfig = ''
   input "2:7:SynPS/2_Synaptics_TouchPad" {
       dwt enabled
       tap enabled
       natural_scroll disabled
       middle_emulation enabled
    }
    '';


    enable = true;
    config = {
      #input = {
      #"*" = {
      #"repeat_delay" = "230";
      #"repeat_rate" = "23";
      #};
      #};
      modifier = "Mod4";
      floating.modifier = "Mod4";
      floating.border = 0;
      window.border = 0;
      focus.forceWrapping = false;
      focus.followMouse = false;
      fonts = { names = [ "RobotoMono" ]; size = 9.0; };
      terminal = "${pkgs.alacritty}/bin/alacritty}";
      startup = [
        #{ command = "waybar"; always = true; notification = false; }
      ];


      menu = "${pkgs.g-rofi}/bin/rofi -show drun -modi drun";
      modes.resize = {
        Escape = "mode default";
        Return = "mode default";
        "${down}" = "resize grow height 10 px or 10 ppt";
        "${left}" = "resize shrink width 10 px or 10 ppt";
        "${right}" = "resize grow width 10 px or 10 ppt";
        "${up}" = "resize shrink height 10 px or 10 ppt";
      };

      #    bars = mkForce [ ];
      bars = [{
        "command" = "${waybar}/bin/waybar";
      }];
      keybindings = {
  "${modifier}+Return" = "exec ${term}";
  "${modifier}+c" = "kill";
  "${modifier}+d" = "exec ${menu}";
  "floating_modifier ${modifier}" = "normal";
  "${modifier}+Shift+r" = "reload";
  "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

  "${modifier}+${left}" = "focus left";
  "${modifier}+${down}" = "focus down";
  "${modifier}+${up}" = "focus up";
  "${modifier}+${right}" = "focus right";

  "${modifier}+Shift+${left}" = "move left";
  "${modifier}+Shift+${down}" = "move down";
  "${modifier}+Shift+${up}" = "move up";
  "${modifier}+Shift+${right}" = "move right";

  "${modifier}+1" = "workspace number 1";
  "${modifier}+2" = "workspace number 2";
  "${modifier}+3" = "workspace number 3";
  "${modifier}+4" = "workspace number 4";
  "${modifier}+5" = "workspace number 5";
  "${modifier}+6" = "workspace number 6";
  "${modifier}+7" = "workspace number 7";
  "${modifier}+8" = "workspace number 8";
  "${modifier}+9" = "workspace number 9";
  "${modifier}+0" = "workspace number 10";

  "${modifier}+Shift+1" = "move container to workspace number 1";
  "${modifier}+Shift+2" = "move container to workspace number 2";
  "${modifier}+Shift+3" = "move container to workspace number 3";
  "${modifier}+Shift+4" = "move container to workspace number 4";
  "${modifier}+Shift+5" = "move container to workspace number 5";
  "${modifier}+Shift+6" = "move container to workspace number 6";
  "${modifier}+Shift+7" = "move container to workspace number 7";
  "${modifier}+Shift+8" = "move container to workspace number 8";
  "${modifier}+Shift+9" = "move container to workspace number 9";
  "${modifier}+Shift+0" = "move container to workspace number 10";

  "${modifier}+b" = "splith";
  "${modifier}+v" = "splitv";
  "${modifier}+s" = "layout stacking";
  "${modifier}+w" = "layout tabbed";
  "${modifier}+e" = "layout toggle split";
  "${modifier}+f" = "fullscreen";
  "${modifier}+Shift+space" = "floating toggle";
  "${modifier}+space" = "focus mode_toggle";
  "${modifier}+a" = "focus parent";

  "${modifier}+Shift+minus" = "move scratchpad";
  "${modifier}+minus" = "scratchpad show";
      };
    };
  };
}
