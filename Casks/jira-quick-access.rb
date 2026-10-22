cask "jira-quick-access" do
  version "1.3.1"
  sha256 "5dcc97227399eee92c2e9c67aa1c21d0fe30372543026ef2dd69d4c7a3aff14e"

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
