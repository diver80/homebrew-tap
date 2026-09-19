cask "jira-quick-access" do
  version "1.0.6"
  sha256 "72c744c112f7f8f0f6f55754c2c5bab999c86f727a3b3461b3c4c0b19f55548b"

  url "https://github.com/diver80/jira-quick-access/releases/download/v#{version}/Jira.Quick.Access-v#{version}-macOS-Universal.dmg"
  name "Jira Quick Access"
  desc "Fast keyboard-driven Jira navigation and search utility"
  homepage "https://github.com/diver80/jira-quick-access"

  app "Jira Quick Access.app"

  zap trash: [
    "~/.jira-quick-access.json",
    "~/Library/Preferences/com.avono.jira-quick-access.plist",
  ]
end
