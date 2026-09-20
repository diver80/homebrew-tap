cask "simple-time-tracker" do
  version "1.0.3"
  sha256 "3783977846cd378e8f06842988f76f6e00d413eed2a2a84e8042af4c6d928cec"

  url "https://github.com/diver80/simple-time-tracker/releases/download/v#{version}/Simple.Time.Tracker-v#{version}-macOS-Universal.dmg"
  name "Simple Time Tracker"
  desc "Lightweight desktop time tracker and billing utility"
  homepage "https://github.com/diver80/simple-time-tracker"

  app "Simple Time Tracker.app"
  binary "#{appdir}/Simple Time Tracker.app/Contents/MacOS/stt"

  zap trash: [
    "~/Library/Application Support/simple-time-tracker",
    "~/Library/Application Support/time-tracker",
    "~/Library/Preferences/com.avono.simple-time-tracker.plist",
  ]

  caveats <<~EOS
    If macOS blocks the app on first launch (unidentified developer), run:
      xattr -dr com.apple.quarantine "/Applications/Simple Time Tracker.app"
  EOS
end
