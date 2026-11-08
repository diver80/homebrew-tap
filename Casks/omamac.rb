cask "omamac" do
  version "1.2.1"
  sha256 "4aa6e155ac34861df48279d3b7998ad20a25d2e148f551251e18046c6b3eb8a0"

  url "https://github.com/diver80/omamac/releases/download/v#{version}/omamac-#{version}.dmg"
  name "OmaMac"
  desc "Menu bar status panels, Jira Quick-Access and Atlassian status for macOS"
  homepage "https://github.com/diver80/omamac"

  # OmaMac updates itself from GitHub releases (signed mygo updates)
  auto_updates true
  depends_on macos: ">= :ventura"

  app "OmaMac.app"

  zap trash: [
    "~/.config/omamac",
    "~/Library/Preferences/de.diver80.omamac.plist",
  ]

  caveats <<~EOS
    OmaMac is not notarized. If macOS blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/OmaMac.app
    or install with: brew install --cask --no-quarantine diver80/tap/omamac
  EOS
end
