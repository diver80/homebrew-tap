class Omathunder < Formula
  desc "Renamed to MailDiver — native Email, Calendar & Contacts suite with flexible AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.5.0"
  license "MIT"

  deprecate! date: "2026-11-20", because: "was renamed to maildiver (use `brew install --cask diver80/tap/maildiver` on macOS or `brew install diver80/tap/maildiver` on Linux)"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "5d54d37c9d7a10683f120649d83359a318063005d7e255dd88ad92da3610a48e"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "2b0399e6a2ab53ea305ba42b18804fb8cd68fc495e115953f616144f566df4af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "2012d07ddc9dd51e8433e8645a7944ddd6ce2d25e580c8a99f5eb1a3910db0cf"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "1f4802ff9c4b534eda32ce56e61f0876dacba4fc67dee2a0ac40b40067cb9e91"
    end
  end

  def install
    bin.install Dir["maildiver-*"].first => "maildiver"
    bin.install_symlink bin/"maildiver" => "omathunder"
  end

  def caveats
    <<~EOS
      OmaThunder has been renamed to MailDiver (standalone, no Thunderbird needed).
      Switch to MailDiver:
        macOS (App bundle + CLI): brew install --cask diver80/tap/maildiver
        Linux / CLI:              brew install diver80/tap/maildiver
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maildiver --version")
  end
end
