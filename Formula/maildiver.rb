class Maildiver < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.7.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "72c9845493c8603da9a296dd4220b2ca5a8312cc5f591df7e2a5f7a5373ac208"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "22f80a6ed264c411eb746f572ae35af1ee7952d30c54d2a5acfdb6381457fe5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "1310fc749dd4b100b67bbf4382729f71d8154b2c4ce83406e6b659bf42c23619"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "fb51812c67466b80c48238c40cce77d3ffa337e90ee817ac0c208e7e4cc7b8a6"
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
