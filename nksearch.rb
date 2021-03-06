class Nksearch < Formula
  desc "nksearch"
  homepage "https://github.com/kisp/nksearch"
  url "https://github.com/kisp/nksearch/archive/0.1.22.tar.gz"
  version "0.1.22"
  sha256 "4e63b1f1fb7e57df998b7930a419d79f1c185c0f862e39bb7131865179e1f475"

  depends_on "sbcl" => :build

  head "https://github.com/kisp/nksearch.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "./configure", "--prefix=#{HOMEBREW_PREFIX}"
    system "make"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    system "nksearch"
    system "nksearch", "--version"
  end
end
