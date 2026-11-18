class Omathunder < Formula
  desc "Mail app with AI copilot on top of Thunderbird, plus Omarchy themes"
  homepage "https://github.com/diver80/omathunder"
  url "https://github.com/diver80/omathunder/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e876fbd38e1ef12c3788fb480457f379d12b89aa65f48b0f9d6133621bdb2bce"
  license "MIT"
  head "https://github.com/diver80/omathunder.git", branch: "main"

  depends_on "go" => :build
  uses_from_macos "zip" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/omathunder"

    if OS.mac?
      # The app as a real bundle (Dock icon, notifications); `omathunder ui` finds it next to bin/.
      arch = Hardware::CPU.arm? ? "arm64" : "amd64"
      ENV["MYGO_LDFLAGS"] = "-X main.version=#{version}"
      system "go", "run", "github.com/egoist/mygo/cmd/mygo@v0.7.4", "build",
             "-platform", "darwin/#{arch}", "-skip-dmg", "-o", buildpath/"appdist"
      prefix.install buildpath/"appdist/darwin-#{arch}/OmaThunder.app"
    else
      system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"omathunder-ui"), "./cmd/omathunder-ui"
    end

    cd "extension" do
      system "zip", "-q", "-r", buildpath/"omathunder-extension.xpi", ".", "-x", "*.DS_Store"
    end
    pkgshare.install "omathunder-extension.xpi"
  end

  def caveats
    s = <<~EOS
      Register OmaThunder with Thunderbird (once):
        omathunder setup

      Install the add-on in Thunderbird
      (Add-ons and Themes > gear icon > Install Add-on From File):
        #{opt_pkgshare}/omathunder-extension.xpi
      Then open its settings (toolbar button "OmaThunder"), switch on the
      local bridge and enable the accounts OmaThunder may change.

      Start the app:
        omathunder ui
    EOS
    if OS.mac?
      s += <<~EOS

        To find the app in Launchpad and Spotlight:
          ln -sf #{opt_prefix}/OmaThunder.app ~/Applications/
      EOS
    end
    s + <<~EOS

      After `brew upgrade omathunder`, install the .xpi again so add-on and
      helper versions match.

      Remove everything (also deletes OmaThunder's settings and state):
        omathunder uninstall && brew uninstall omathunder
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omathunder version")
    assert_path_exists pkgshare/"omathunder-extension.xpi"
    if OS.mac?
      assert_path_exists prefix/"OmaThunder.app/Contents/MacOS/OmaThunder"
    else
      assert_path_exists bin/"omathunder-ui"
    end
  end
end
