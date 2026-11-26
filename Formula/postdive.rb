class Postdive < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"
  version "0.7.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-arm64"
      sha256 "17f9eea3d216eef3a2f1d2d504cdc0ae2e3bedd90a0aaa7ea02add8a9b672f82"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-darwin-amd64"
      sha256 "139028d2e1504a2c0bfc68ba1b5e8e882f293b69eb342c6c3167c23b4b68339e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-arm64"
      sha256 "32e386fd06502577e1b558aa46d5c012d2a327b09cb42bac0d4b1b8011949e7e"
    else
      url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-linux-amd64"
      sha256 "924d06e3d692757b7b2c963e5405786b7dd8b3b2e8c283758ff364d3c0962bed"
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
