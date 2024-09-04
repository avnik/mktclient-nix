{
  lib,
  src,
  python3,
  qt6,
}:
python3.pkgs.buildPythonApplication {
  version = "git";
  pname = "mtkclient";
  format = "pyproject";

  inherit src;
  # unit tests are impure
  # doCheck = false;

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    qt6.wrapQtAppsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    colorama
    fusepy
    mock
    pycryptodome
    pycryptodomex
    pyserial
    pyside6
    pyusb
    shiboken6
  ];

  buildInputs = [ qt6.qtwayland ];

  meta = with lib; {
    description = "Just some mtk tool for exploitation, reading/writing flash and doing crazy stuff";
    homepage = ""https://github.com/bkerler/mtkclient;
    license = licenses.gpl3;
  };
}
