class Postdive < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"
  version "0.7.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-arm64"
      sha256 "244858d07a0f638a3e23b12b1ca82e29c6194c0d49de104254ed84fb6ab11e87"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-amd64"
      sha256 "60e0c62615e6785fa2445c2c9a8e280a0324d0f3c21bcde7cbc9dfdd5d77baeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-arm64"
      sha256 "5d4a827b8501f68fe8011b6a5829ff11acbf612b0be01c68573d278e03bc6c80"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-amd64"
      sha256 "854573d5406370d65716c8de17bf363d51972aef39edde36a9396a69a2c7e896"
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
