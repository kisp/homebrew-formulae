class SbclWrap < Formula
  desc "Wrapper around sbcl for fast script execution with (on demand compiled and cached) libraries"
  homepage "https://github.com/kisp/sbcl-wrap"
  url "https://github.com/kisp/sbcl-wrap/archive/0.0.5.tar.gz"
  version "0.0.5"
  sha256 "74a44349cb24c8c330af615b815069825a9d100aec50436c999423f6ad68820a"

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
