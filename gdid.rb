class Gdid < Formula
  desc "gdid. cli version"
  homepage "https://github.com/kisp/gdid"
  url "https://github.com/kisp/gdid/archive/0.0.11.tar.gz"
  version "0.0.11"
  sha256 "922034584a7a2d29d57d82c81326b7ca076d5194b84da61d7c1ea8f293fa2a14"

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
