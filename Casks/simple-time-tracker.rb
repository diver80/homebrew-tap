cask "simple-time-tracker" do
  version "1.0.6"
  sha256 "5a34a7969bfb1b90a2fa6f248ad3272abc6977f848f6b0674c956f83b7daba23"

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
