cask "jira-quick-access" do
  version "1.0.8"
  sha256 "ac13edaa5ef0f93edf6c2b5f11e3b10e686f4c2647244a94fd20013852d7958e"

  url "https://github.com/diver80/jira-quick-access/releases/download/v#{version}/Jira.Quick.Access-v#{version}-macOS-Universal.dmg"
  name "Jira Quick Access"
  desc "Fast keyboard-driven Jira navigation and search utility"
  homepage "https://github.com/diver80/jira-quick-access"

  app "Jira Quick Access.app"

  zap trash: [
    "~/.jira-quick-access.json",
    "~/Library/Preferences/com.avono.jira-quick-access.plist",
  ]

  caveats <<~EOS
    If macOS blocks the app on first launch (unidentified developer), run:
      xattr -dr com.apple.quarantine "/Applications/Jira Quick Access.app"
  EOS
end
