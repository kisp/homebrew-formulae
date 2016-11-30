class Gdid < Formula
  desc "gdid. cli version"
  homepage "https://github.com/kisp/gdid"
  url "https://github.com/kisp/gdid/archive/0.0.12.tar.gz"
  version "0.0.12"
  sha256 "727feda17a1ccbe6af259984fa2d1d89991b2f3c78cdcdc22579e0c862228144"

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
