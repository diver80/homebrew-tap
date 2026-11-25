class Postdive < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"
  version "0.7.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-arm64"
      sha256 "0d11cd3ed027a94f22f224bd5329e84ffa0ea16e4f3fe532aeb0b86ad8425259"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-amd64"
      sha256 "548da1c6bee1d16e48ed114006b71c3f8817625b402ce85914da246d7249954a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-arm64"
      sha256 "f0a6dd8db481aa266dd984d0c2f7460893cc4d590b224a187bdee42678513aab"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-amd64"
      sha256 "73226120155b984d57e70446746e0f09e9fc9d1f1eb6f299e8c26fee3b647156"
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
