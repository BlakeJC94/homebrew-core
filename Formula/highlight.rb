class Highlight < Formula
  desc "Convert source code to formatted text with syntax highlighting"
  homepage "http://www.andre-simon.de/doku/highlight/en/highlight.html"
  url "http://www.andre-simon.de/zip/highlight-3.23.tar.bz2"
  sha256 "bcc7a4e12aa8fc20cc4bf0bd550992f41f0c22f9e81bb0cd1f58abea8ce272b1"

  head "svn://svn.code.sf.net/p/syntaxhighlight/code/highlight/"

  bottle do
    sha256 "f530e34bbd1769fc6f434e65cbb7b81eef505d1508bfe24ca74277685407b6a3" => :yosemite
    sha256 "8a9d9ecea3d0045dd4736859535cda66cb47cb1fc222b6244458350be62c2d39" => :mavericks
    sha256 "81d3718fd0a1258a75d7ebce4ca36adb4ff0577e9c25dae5beae981dbdf61ade" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "lua"

  def install
    conf_dir = etc/"highlight/" # highlight needs a final / for conf_dir
    system "make", "PREFIX=#{prefix}", "conf_dir=#{conf_dir}"
    system "make", "PREFIX=#{prefix}", "conf_dir=#{conf_dir}", "install"
  end

  test do
    system bin/"highlight", doc/"examples/highlight_pipe.php"
  end
end
