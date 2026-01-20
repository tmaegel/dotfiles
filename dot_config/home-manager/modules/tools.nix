{ pkgs, ... }:
{

  home.packages = with pkgs; [
    freeze
    glow
    nap
    pet
    smug
  ];

}
