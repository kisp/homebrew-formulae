class DocumentTemplates < Formula
  VERSION = "0.0.14"
  desc "document-templates"
  homepage "https://github.com/kisp/document-templates"
  url "https://github.com/kisp/document-templates/archive/#{VERSION}.tar.gz"
  version VERSION
  sha256 "877be439591f7e0d8702af2bb77028032dc70051686d5a357a5d944417592cee"

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
