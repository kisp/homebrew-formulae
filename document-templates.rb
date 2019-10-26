class DocumentTemplates < Formula
  VERSION = "0.0.16"
  desc "document-templates"
  homepage "https://github.com/kisp/document-templates"
  url "https://github.com/kisp/document-templates/archive/#{VERSION}.tar.gz"
  version VERSION
  sha256 "2cae17caf70d5b0cfa2eba0885a7c0fd5ec78616ac70e9a601d10d8f4d552db5"

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
