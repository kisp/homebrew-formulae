class Nksearch < Formula
  desc "nksearch"
  homepage "https://github.com/kisp/nksearch"
  url "https://github.com/kisp/nksearch/archive/0.1.14.tar.gz"
  version "0.1.14"
  sha256 "48114f5f1fedda0be3f7409da3424f43ad3ec1390fac12f41856e48b4a5c2733"

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
