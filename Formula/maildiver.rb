class Maildiver < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.7.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "06bbf8a95637024ce05b0683e1b59dd5b05662a2abc7191e3066cd46a6fd7aae"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "d31c42405a2cfa3c80399a11d3f690d05797984442f219c61959b65d88df93fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "5968f38dc0b00c664db0edfb3edae3997eae12ccce4cee4c45194e2d4986d24a"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "fa83a9e1548ee0165b1155cc07bce0d6f0adea6cb4e43893e4927f38bff5fb10"
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
