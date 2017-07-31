class SbclWrap < Formula
  desc "Wrapper around sbcl for fast script execution with (on demand compiled and cached) libraries"
  homepage "https://github.com/kisp/sbcl-wrap"
  url "https://github.com/kisp/sbcl-wrap/archive/0.0.6.tar.gz"
  version "0.0.6"
  sha256 "7b22c38ec87dd17c2c0ee3f4cd6685476bc723584d09d0b8dddd28e592059d20"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  head "https://github.com/kisp/sbcl-wrap.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "cabal update"
    system "cabal sandbox init"
    system "cabal install --only-dependencies"
    system "cabal build"

    system "mkdir -p #{prefix}/bin"
    system "install dist/build/sbcl-wrap/sbcl-wrap #{prefix}/bin"
  end

  test do
    system "sbcl-wrap"
  end
end
