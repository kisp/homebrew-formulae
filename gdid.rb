class Gdid < Formula
  desc "gdid. cli version"
  homepage "https://github.com/kisp/gdid"
  url "https://github.com/kisp/gdid/archive/0.0.11.tar.gz"
  version "0.0.11"
  sha256 "fd6a8351e355c6e9af827fc3dcbaed9a9b3f20cf0aea36342d26a30740a5e926"

  depends_on "sbcl" => :build

  head "https://github.com/kisp/gdid.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "./configure", "--prefix=#{HOMEBREW_PREFIX}"
    system "make"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    system "gdid"
    system "gdid", "--version"
  end
end
