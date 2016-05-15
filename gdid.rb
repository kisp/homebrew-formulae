class Gdid < Formula
  desc "gdid. cli version"
  homepage "https://github.com/kisp/gdid"
  url "https://github.com/kisp/gdid/archive/0.0.9.tar.gz"
  version "0.0.9"
  sha256 "6ad2902993179281b24f3cf2c4d54bfc849c56be4ba41586e079b93a67574b16"

  depends_on "sbcl" => :build

  head "https://github.com/kisp/gdid.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "make"
    system "make", "DESTDIR=#{prefix}/", "install"
  end

  test do
    system "gdid"
    system "gdid", "--version"
  end
end
