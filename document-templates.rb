class DocumentTemplates < Formula
  desc "document-templates"
  homepage "https://github.com/kisp/document-templates"
  url "https://github.com/kisp/document-templates/archive/0.0.13.tar.gz"
  version "0.0.13"
  sha256 "00c504080b0c04da04316fdf8afd92e52daa3c4444353044efe0dcb25769e1ba"

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
