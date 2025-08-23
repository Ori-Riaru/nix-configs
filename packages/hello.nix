{
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation rec {
  pname = "hello";
  version = "2.12.1";
  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-${version}.tar.gz";
    hash = "sha256-1kJjhtlsAkpNB7f6tZEs+dbKd8z7KoNHyDHEJ0tmhnc=";
  };
}
