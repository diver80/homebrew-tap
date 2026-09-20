cask "simple-time-tracker" do
  version "1.0.4"
  sha256 "e323b2f6e12ef7a4440679a51cd78fbd2aec2b6b9b1de868cd1dca6734f8ffd6"

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
