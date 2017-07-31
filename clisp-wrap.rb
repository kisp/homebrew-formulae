class ClispWrap < Formula
  desc "Wrapper around clisp for fast script execution with (on demand compiled and cached) libraries"
  homepage "https://github.com/kisp/clisp-wrap"
  url "https://github.com/kisp/clisp-wrap/archive/0.0.6.tar.gz"
  version "0.0.6"
  sha256 "2f6f36b2097525ce3379ace94be712c46c8a4e0381f68b5fded4052f2843a21d"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  head "https://github.com/kisp/clisp-wrap.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "cabal update"
    system "cabal sandbox init"
    system "cabal install --only-dependencies"
    system "cabal build"

    system "mkdir -p #{prefix}/bin"
    system "install dist/build/clisp-wrap/clisp-wrap #{prefix}/bin"
  end

  test do
    system "clisp-wrap"
  end
end
