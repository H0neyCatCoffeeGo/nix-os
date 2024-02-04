{ pkgs, config, ... }:
{
  programs.waybar =
    let colors = config.colorScheme.colors;
    in {
      enable = true;
      style = ''

      @define-color base00 #${colors.base00};
      @define-color base01 #${colors.base01};
      @define-color base02 #${colors.base02};
      @define-color base03 #${colors.base03};
      @define-color base04 #${colors.base04};
      @define-color base05 #${colors.base05};
      @define-color base06 #${colors.base06};
      @define-color base07 #${colors.base07};
      @define-color base08 #${colors.base08};
      @define-color base09 #${colors.base09};
      @define-color base0A #${colors.base0A};
      @define-color base0B #${colors.base0B};
      @define-color base0C #${colors.base0C};
      @define-color base0D #${colors.base0D};
      @define-color base0E #${colors.base0E};
      @define-color base0F #${colors.base0F};

      /* Keyframes */

      @keyframes blink-critical {
        to {
          /*color: @base05;*/
          background-color: @critical;
        }
      }

      @define-color warning     @base02;
      @define-color critical    @base08;
      @define-color mode    @base00;
      @define-color unfocused    @base00;
      @define-color focused    @base0C;
      @define-color inactive    @base0E;
      @define-color sound    @base0E;
      @define-color network    @base0B;
      @define-color memory    @base0C;
      @define-color cpu    @base0B;
      @define-color temp    @base01;
      @define-color layout    @base02;
      @define-color battery    @base0C;
      @define-color date    @base00;
      @define-color time    @base06;

      @define-color background @base00;

      /* Reset all styles */
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;
        box-shadow: none;
        text-shadow: none;
        icon-shadow: none;
      }

      /* The whole bar */
      #waybar {
        background: @base00; /* #282828e0 */
        color: @base05;
        font-family: JetBrainsMono Nerd Font, Siji;
        font-size: 10pt;
        /*font-weight: bold;*/
      }

      /* Each module */
      #battery,
      #clock,
      #cpu,
      #language,
      #memory,
      #mode,
      #network,
      #pulseaudio,
      #temperature,
      #tray,
      #backlight,
      #idle_inhibitor,
      #disk,
      #user,
      #mpris {
        padding-left: 8pt;
        padding-right: 8pt;
      }

      /* Each critical module */
      #mode,
      #memory.critical,
      #cpu.critical,
      #temperature.critical,
      #battery.critical.discharging {
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        animation-name: blink-critical;
        animation-duration: 1s;
      }

      /* Each warning */
      #network.disconnected,
      #memory.warning,
      #cpu.warning,
      #temperature.warning,
      #battery.warning.discharging {
        color: @warning;
      }

      /* And now modules themselves in their respective order */

      /* Current sway mode (resize etc) */
      #mode {
        color: @base05;
        background: @mode;
      }

      /* Workspaces stuff */

      #workspaces button {
        /*font-weight: bold;*/
        min-width: 25px;
        color: @base05;
        background: @unfocused;
      }

      /* Inactive (on unfocused output) */
      #workspaces button.visible {
        color: @base05;
        background: @inactive;
      }

      /* Active (on focused output) */
      #workspaces button.focused {
        color: @base00;
        background: @focused;
      }

      /* Contains an urgent window */
      #workspaces button.urgent {
        color: @base00;
        background: @warning;
      }

      /* Style when cursor is on the button */
      #workspaces button:hover {
        background: @base01;
        color: @base0D;
      }

      #window {
        margin-right: 35pt;
        margin-left: 35pt;
      }

      #pulseaudio {
        background: @sound;
        color: @base00;
      }

      #network {
        background: @network;
        color: @base00;
      }

      #memory {
        background: @memory;
        color: @base00;
      }

      #cpu {
        background: @cpu;
        color: @base05;
      }

      #temperature {
        background: @temp;
        color: @base00;
      }

      #language {
        background: @layout;
        color: @base00;
      }

      #battery {
        background: @battery;
        color: @base00;
      }

      #tray {
        background: @date;
      }

      #clock.date {
        background: @date;
        color: @base05;
      }

      #clock.time {
        background: @time;
        color: @base00;
      }

      #custom-arrow1 {
        font-size: 11pt;
        color: @time;
        background: @date;
      }

      #custom-arrow2 {
        font-size: 11pt;
        color: @date;
        background: @battery;
      }

      #custom-arrow3 {
        font-size: 11pt;
        color: @battery;
        background: @network;
      }

      #custom-arrow4 {
        font-size: 11pt;
        color: @network;
        background: @sound;
      }

      #custom-arrow5 {
        font-size: 11pt;
        color: @sound;
        background: @base00;
      }

      #custom-arrow6 {
        font-size: 11pt;
        color: @cpu;
        background: @memory;
      }

      #custom-arrow7 {
        font-size: 11pt;
        color: @memory;
        background: @network;
      }

      #custom-arrow8 {
        font-size: 11pt;
        color: @network;
        background: @sound;
      }

      #custom-arrow9 {
        font-size: 11pt;
        color: @sound;
        background: transparent;
      }

      #custom-arrow10 {
        font-size: 11pt;
        color: @unfocused;
        background: transparent;
      }

      '';
    };
}
