class Omathunder < Formula
  desc "Omarchy themes, AI writing assistant and mail triage for Thunderbird"
  homepage "https://github.com/diver80/omathunder"
  url "https://github.com/diver80/omathunder/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "6dca14917e50da76e9b297415e1e064dc7fa7bc094135c8c3df3f1b3ed7d9242"
  license "MIT"
  head "https://github.com/diver80/omathunder.git", branch: "main"

  depends_on "go" => :build
  uses_from_macos "zip" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/omathunder"
    cd "extension" do
      system "zip", "-q", "-r", buildpath/"omathunder-extension.xpi", ".", "-x", "*.DS_Store"
    end
    pkgshare.install "omathunder-extension.xpi"
  end

  def caveats
    <<~EOS
      Register OmaThunder with Thunderbird (once):
        omathunder setup

      Then install the add-on in Thunderbird
      (Add-ons and Themes > gear icon > Install Add-on From File):
        #{opt_pkgshare}/omathunder-extension.xpi

      After `brew upgrade omathunder`, install the .xpi again so add-on and
      host versions match.

      Remove everything (also deletes OmaThunder's rules and settings):
        omathunder uninstall && brew uninstall omathunder
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omathunder version")
    assert_path_exists pkgshare/"omathunder-extension.xpi"
  end
end
