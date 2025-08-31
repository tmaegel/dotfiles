{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ansible-language-server
    ansible-lint
    djhtml
    djlint
    dockerfile-language-server-nodejs
    fd
    golangci-lint
    golines
    gopls
    helm-ls
    lua-language-server
    markdownlint-cli
    nil
    nixfmt-rfc-style
    nodePackages.bash-language-server
    nodePackages.prettier
    nodePackages.typescript-language-server
    pyright
    python311Packages.black
    python311Packages.flake8
    python311Packages.isort
    python311Packages.mypy
    ripgrep
    shellcheck
    shfmt
    stylua
    terraform-ls
    yaml-language-server
    yamlfmt
    yamllint
  ];

}
