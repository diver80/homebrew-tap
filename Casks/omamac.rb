cask "omamac" do
  version "1.4.0"
  sha256 "cc913263d754491503d5a11f4a5b8cfc9fc5fc3d0404b0c938db8da387cd4c5c"

  url "https://github.com/diver80/omamac/releases/download/v#{version}/omamac-#{version}.dmg"
  name "OmaMac"
  desc "Menu bar status panels, Jira Quick-Access and Atlassian status for macOS"
  homepage "https://github.com/diver80/omamac"

  # OmaMac updates itself from GitHub releases (signed mygo updates)
  auto_updates true
  depends_on macos: :ventura

  app "OmaMac.app"

  zap trash: [
    "~/.config/omamac",
    "~/Library/Preferences/de.diver80.omamac.plist",
  ]

  # OmaMac is ad-hoc signed, not notarized: drop the download quarantine so
  # Gatekeeper lets it start (Homebrew 7 removed --no-quarantine).
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/OmaMac.app"],
        writable_paths: ["OmaMac.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  caveats <<~EOS
    OmaMac is not notarized. If macOS still blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/OmaMac.app
  EOS
end
