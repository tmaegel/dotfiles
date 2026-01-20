{ pkgs, ... }:
{

  home.packages = with pkgs; [
    devpod
    k9s
    kubecolor
  ];

}
