cask "sparkdown" do
  version "0.4.1"
  sha256 "2fbdf1258ce6455c5e442422e97631747069c38ad28783013a7928f1f199ceb8"

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
