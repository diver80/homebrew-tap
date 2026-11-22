cask "maildiver" do
  version "0.7.11"
  sha256 "5d4a6af6a28af6fd2cf3a97b9d302c3f04d744f5d2e00c231a0070aa2dee1638"

  url "https://github.com/diver80/maildiver/releases/download/v#{version}/maildiver-#{version}.dmg"
  name "MailDiver"
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/maildiver/"

  depends_on macos: :monterey

  app "MailDiver.app"
  binary "#{appdir}/MailDiver.app/Contents/MacOS/MailDiver", target: "maildiver"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/MailDiver.app"],
        writable_paths: ["MailDiver.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Application Support/maildiver",
    "~/Library/Caches/maildiver",
    "~/Library/Preferences/dev.maildiver.app.plist",
  ]

  caveats <<~EOS
    MailDiver is ad-hoc signed (not notarized). If macOS still blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/MailDiver.app
  EOS
end
