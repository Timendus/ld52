{ pkgs, config, lib, ... }:

{
  packages = with pkgs; [
    godot
  ];
}
