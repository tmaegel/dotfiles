{ pkgs, ... }:
{

  home.packages = with pkgs; [
    devcontainer
    devpod
    k9s
    kubecolor
  ];

}
