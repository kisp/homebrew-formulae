class ClispWrap < Formula
  desc "Wrapper around clisp for fast script execution with (on demand compiled and cached) libraries"
  homepage "https://github.com/kisp/clisp-wrap"
  url "https://github.com/kisp/clisp-wrap/archive/0.0.5.tar.gz"
  version "0.0.5"
  sha256 "c3b8ebe5fa80f4345711f7d0a2cd28cbc2d2adea92262cd78d2b2a8ac6540b90"

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
