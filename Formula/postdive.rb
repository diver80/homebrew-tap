class Postdive < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"
  version "0.7.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-arm64"
      sha256 "4a6bd3d795e26f06885a11907110af04093e2cfb1a82732db544d52f567dce7d"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-amd64"
      sha256 "867e9b4ef64f541a7150f56766abaf6fca56cdd177128b3657da1a0dade8d7c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-arm64"
      sha256 "6599ec5958cab0f31c0446c6af74695cb96d10c8670bd753e8359ecd378c581a"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-amd64"
      sha256 "fee37eca9240fee51017931fce5e6ba87243d616b36b905827f31460924c66db"
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
