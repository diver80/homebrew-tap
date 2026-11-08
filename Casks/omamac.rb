cask "omamac" do
  version "1.2.0"
  sha256 "04dc69ce70c72aed89c2e5b132c2453e1f08cb4995695449b417922e624649ab"

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
    "~/Library/Preferences/com.avono.omamac.plist",
  ]

  caveats <<~EOS
    OmaMac is not notarized. If macOS blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/OmaMac.app
    or install with: brew install --cask --no-quarantine diver80/tap/omamac
  EOS
end
