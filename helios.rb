require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.8.257/helios-tools-0.8.257-shaded.jar"
  sha1 "e49056923903b2b2ee4648127f570a3030b2bd5b"
  version "0.8.257"

  depends_on :java => "1.7"

  def install
    libexec.install "helios-tools-0.8.257-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.8.257-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
