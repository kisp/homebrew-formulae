class Gdid < Formula
  desc "gdid. cli version"
  homepage "https://github.com/kisp/gdid"
  url "https://github.com/kisp/gdid/archive/0.0.13.tar.gz"
  version "0.0.13"
  sha256 "17d5593b7fb3b4c456f11941af06bf8de3d786d56eac0a1019ef5e34c5ca59f7"

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
