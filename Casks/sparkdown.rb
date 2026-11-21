cask "sparkdown" do
  version "0.4.4"
  sha256 "e7cd9a795d327f8e360c6acd4f6658c0ade4a61edee956535db4e35f1f0d1edd"

  url "https://github.com/sparkdown/sparkdown/releases/download/v#{version}/SparkDown_#{version}_aarch64.dmg"
  name "SparkDown"
  desc "Markdown editor for you and your coding agents"
  homepage "https://sparkdown.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "SparkDown.app"
  binary "#{appdir}/SparkDown.app/Contents/Resources/resources/bin/sparkdown"

  zap trash: [
    "~/Library/Application Support/com.sparkdown.editor",
    "~/Library/Caches/com.sparkdown.editor",
    "~/Library/HTTPStorages/com.sparkdown.editor",
    "~/Library/Logs/com.sparkdown.editor",
    "~/Library/Preferences/com.sparkdown.editor.plist",
    "~/Library/Saved Application State/com.sparkdown.editor.savedState",
    "~/Library/WebKit/com.sparkdown.editor",
  ]

  caveats <<~EOS
    SparkDown is ad-hoc signed and not notarized by Apple, so macOS may block
    the first launch. Either right-click SparkDown.app in /Applications and
    choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/SparkDown.app
  EOS
end
