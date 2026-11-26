class Postdive < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"
  version "0.7.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-arm64"
      sha256 "ce17abd5553e0fc45115ce4e13d6535decc33ab8ab5d45a8a9ad045e1417e9d8"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-amd64"
      sha256 "99133741c7112e16fce36b60178021c30a819fc4ae3c958e3acfe418c5210359"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-arm64"
      sha256 "0e731af90b09664f23cba948d829ac6ed4b9dfc3b7ab30f709c53ba86b7da3c5"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-amd64"
      sha256 "0cd9e5a319b614a7de1f9f89392c0ef72559c7c73c27a9fef302779a1ad74f76"
    end
  end

  def install
    bin.install Dir["postdive-*"].first => "postdive"
  end

  def caveats
    if OS.mac?
      <<~EOS
        For the macOS PostDive.app bundle (Dock icon, notifications, mailto: handler),
        prefer the Homebrew Cask instead:
          brew install --cask diver80/tap/postdive
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postdive --version")
  end
end
