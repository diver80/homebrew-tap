cask "postdive" do
  version "0.7.53"
  sha256 "0e9eeaf5bf847e6a1515c5d878cf98102a419cd1b33860e29be00381c76e9959"

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
