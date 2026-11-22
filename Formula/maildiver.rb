class Maildiver < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.7.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "703a8c904151e20c81f6e3cf33c962f28d78ba0c62707f988339687de4b31336"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "154968548627b49f78b5e0559098a81383c3d8a7add6ceab4840bfe15d49f056"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "8ea78255f62a21673770b664b5b443353730e00ae6a8d1b9c9063bed3bd8de1f"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "f0908b23a9a493a6aef7c9287e97cfb7e3c004b31455bc85e655cc6a272c2e1e"
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
