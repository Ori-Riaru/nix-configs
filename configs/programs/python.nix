{pkgs, ...}: {
  home.packages = with pkgs; [
    (
      python3.withPackages
      (python-pkgs:
        with python-pkgs; [
          ruff
          ipython
          ipykernel
          jupyter
          notebook
          numpy
          matplotlib
          torch
          torchvision
          pip
        ])
    )
  ];
}
