cask "jira-quick-access" do
  version "1.3.3"
  sha256 "fcadeaabc939a983246c4c20362544417eaeca291f895941f2378ab4e952e7bf"

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
