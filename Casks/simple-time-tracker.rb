cask "simple-time-tracker" do
  version "1.0.5"
  sha256 "118eb4058514c5740e6f681ec803ebb8b5262ad498b49fdf0614d8f5ed8bd8b8"

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
