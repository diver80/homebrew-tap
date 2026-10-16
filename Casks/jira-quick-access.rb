cask "jira-quick-access" do
  version "1.0.7"
  sha256 "098b0b62c5676cff3b2452a2e85cb2065e3ec2c4f5eb185a75e7f6f2a87002cc"

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
