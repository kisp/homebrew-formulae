class DocumentTemplates < Formula
  VERSION = "0.0.15"
  desc "document-templates"
  homepage "https://github.com/kisp/document-templates"
  url "https://github.com/kisp/document-templates/archive/#{VERSION}.tar.gz"
  version VERSION
  sha256 "543864b9c9e1b8e200909314f7d403df040204cb3ec1f5d5b6da7d8933000586"

  depends_on "sbcl" => :build

  head "https://github.com/kisp/document-templates.git"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    system "./configure", "--prefix=#{HOMEBREW_PREFIX}"
    system "make"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    system "document-templates"
    system "document-templates", "--version"
  end
end
