{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    font = "JetBriansMono NF";
    cycle = true;
    theme = ''
        * {
  bg0     : #1a1b26;
  bg1     : #1f2335;
  bg2     : #24283b;
  bg3     : #414868;
  fg0     : #c0caf5;
  fg1     : #a9b1d6;
  fg2     : #737aa2;
  red     : #f7768e;
  green   : #9ece6a;
  yellow  : #e0af68;
  blue    : #7aa2f7;
  magenta : #9a7ecc;
  cyan    : #4abaaf;

  accent: @red;
  urgent: @yellow;

  background-color : transparent;
  text-color       : @fg0;

  margin  : 0;
  padding : 0;
  spacing : 0;
}

element-icon, element-text, scrollbar {
  cursor: pointer;
}

window {
  location : northwest;
  width    : 280px;
  x-offset : 4px;
  y-offset : 26px;

  background-color: @bg1;
  border: 1px;
  border-color: @bg3;
  border-radius: 6px;
}

inputbar {
  spacing  : 8px;
  padding  : 4px 8px;
  children : [ icon-search, entry ];

  background-color: @bg0;
}

icon-search, entry, element-icon, element-text {
  vertical-align: 0.5;
}

icon-search {
  expand   : false;
  filename : "search-symbolic";
  size     : 14px;
}

textbox {
  padding          : 4px 8px;
  background-color : @bg2;
}

listview {
  padding      : 4px 0px;
  lines        : 12;
  columns      : 1;
  scrollbar    : true;
  fixed-height : false;
  dynamic      : true;
}

element {
  padding : 4px 8px;
  spacing : 8px;
}

element normal urgent {
  text-color: @urgent;
}

element normal active {
  text-color: @accent;
}

element selected {
  text-color       : @bg1;
  background-color : @accent;
}

element selected urgent {
  background-color: @urgent;
}

element-icon {
  size: 0.8em;
}

element-text {
  text-color: inherit;
}

scrollbar {
  handle-width : 4px;
  handle-color : @fg2;
  padding      : 0 4px;
}

            '';
  };
}
