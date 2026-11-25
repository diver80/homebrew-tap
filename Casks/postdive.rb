cask "postdive" do
  version "0.7.35"
  sha256 "d75d83f787c18d1058d4d191a1f172d0583fee39a510ef680440c210c6d1afbc"

  url "https://github.com/diver80/postdive/releases/download/v#{version}/postdive-#{version}.dmg"
  name "PostDive"
  desc "Native Email, Calendar & Contacts suite with flexible local & cloud AI"
  homepage "https://diver80.github.io/postdive/"

  depends_on macos: :monterey

  app "PostDive.app"
  binary "#{appdir}/PostDive.app/Contents/MacOS/PostDive", target: "postdive"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/PostDive.app"],
        writable_paths: ["PostDive.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Application Support/postdive",
    "~/Library/Caches/postdive",
    "~/Library/Preferences/dev.postdive.app.plist",
  ]

  caveats <<~EOS
    PostDive is ad-hoc signed (not notarized). If macOS still blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/PostDive.app
  EOS
end
