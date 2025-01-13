{ lib
, python3Packages
, fetchFromGitHub
}:

python3Packages.buildPythonPackage rec {
  pname = "img2wav";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "shareef12";
    repo = "img2wav";
    rev = "v${version}";
    sha256 = "sha256-YW4MHSraIzSW2MuayEHl+4Y1GPN+xdq6G00PnsdjST8=";  
  };

  propagatedBuildInputs = with python3Packages; [
    numpy
    pillow
  ];

  # The package doesn't have any tests
  doCheck = false;

  meta = with lib; {
    description = "Convert images to wav audio files to view in a spectrogram";
    homepage = "https://github.com/shareef12/img2wav";
    license = licenses.gpl2;
    maintainers = [ ];
    platforms = platforms.all;
  };
}

