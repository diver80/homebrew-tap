cask "avono-timebooking" do
  version "0.1.0"
  sha256 "71b9a4a703e8732ecf7355d7c5c42acb09a7c31723576d820f98fdd89db62159"

  url "https://github.com/diver80/avono-timebooking/releases/download/v#{version}/Avono.Timebooking-v#{version}-macOS-Universal.dmg"
  name "Avono Timebooking"
  desc "Plan working time by week, day and month and book it in Achievo"
  homepage "https://github.com/diver80/avono-timebooking"

  depends_on macos: ">= :monterey"

  app "Avono Timebooking.app"

  zap trash: [
    "~/.avono-timebooking",
    "~/Library/Preferences/com.avono.timebooking.plist",
  ]

  caveats <<~EOS
    If macOS blocks the app on first launch (unidentified developer), run:
      xattr -dr com.apple.quarantine "/Applications/Avono Timebooking.app"
    After each install or upgrade macOS asks once for the keychain
    (Achievo password, Jira tokens): choose "Always Allow".
  EOS
end
