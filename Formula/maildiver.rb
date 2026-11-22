class Maildiver < Formula
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"
  version "0.7.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-arm64"
      sha256 "87a05a10a5f471a7c45a6e9686520484da5d9bf3f7a9f31cb28b6ba385df2a55"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-darwin-amd64"
      sha256 "8f8cfb482029b608fcca2eb9eb646413b94d049658f3759fb8254f10fe119e20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-arm64"
      sha256 "88eab93cc82315ec0e4afc1206f4625efdd666c6603d65cf575a600d344d7029"
    else
      url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-linux-amd64"
      sha256 "a722dcdfd0baad9ffd669fec308e2868d679a4c07a03380d15affe6e7879923b"
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
