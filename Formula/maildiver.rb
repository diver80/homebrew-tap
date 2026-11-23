class Maildiver < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.7.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "5690d455f16ffbcdbef47b20671c1ffc08f4156a015e8bf2499d69fd9b7d73f5"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "78360d39fb48ad310d08cb0a8313bc85d132b4a0bb69c8fd2f050ab38d5e98d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "307b02a8771fb3eaf1b1af165166626b272ee408e3dc57260317edb1c1a37fbc"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "73e81405ddd5177b39500442d4fd4eafd4ded720ff552545a9e12e7d3df8f1a4"
    end
  end

  def install
    bin.install Dir["maildiver-*"].first => "maildiver"
  end

  def caveats
    if OS.mac?
      <<~EOS
        For the macOS MailDiver.app bundle (Dock icon, notifications, mailto: handler),
        prefer the Homebrew Cask instead:
          brew install --cask diver80/tap/maildiver
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maildiver --version")
  end
end
