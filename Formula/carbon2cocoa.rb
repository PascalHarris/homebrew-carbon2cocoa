class Carbon2cocoa < Formula
  desc "Convert Carbon HIToolbox XIB/NIB files to modern Cocoa format"
  homepage "https://github.com/pascalharris/carbon2cocoa"
  url "https://github.com/pascalharris/carbon2cocoa/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "22ea2ba61c680c25fe5040d71b6376710bccbd320041740c50340738228e7fdc"
  license "MIT"
  head "https://github.com/pascalharris/carbon2cocoa.git", branch: "main"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    bin.install "carbon2cocoa"
    man1.install "carbon2cocoa.1"
  end 

  test do
    assert_match "carbon2cocoa version #{version}", shell_output("#{bin}/carbon2cocoa --version")
    assert_match "Carbon to Cocoa XIB Converter", shell_output("#{bin}/carbon2cocoa --help 2>&1")
  end
end
