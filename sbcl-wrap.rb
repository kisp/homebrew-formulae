class SbclWrap < Formula
  desc "Wrapper around sbcl for fast script execution with (on demand compiled and cached) libraries"
  homepage "https://github.com/kisp/sbcl-wrap"
  url "https://github.com/kisp/sbcl-wrap/archive/0.0.5.tar.gz"
  version "0.0.5"
  sha256 "3e7d6ed9ee13b972748f35a50c83294b1bc64217bc07c1b06794b8c3b99301d5"

  depends_on "ghc" => :build
  depends_on "cabal_install" => :build

  head "https://github.com/kisp/sbcl-wrap.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "cabal update"
    system "cabal sandbox init"
    system "cabal install --only-dependencies"
    system "cabal build"
    system "echo #{HOMEBREW_PREFIX}/#{prefix}"
    # system "install dist/build/sbcl-wrap/sbcl-wrap #{HOMEBREW_PREFIX}/#{prefix}"
  end

  test do
    system "sbcl-wrap"
  end
end
