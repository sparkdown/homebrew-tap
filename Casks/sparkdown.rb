cask "sparkdown" do
  version "0.3.1"
  sha256 "ab97d1572e01b601d36e33ad57228985c74d54961dae0e08c1bbb18867cfd63c"

  url "https://github.com/sparkdown/sparkdown/releases/download/v#{version}/SparkDown_#{version}_aarch64.dmg",
      verified: "github.com/sparkdown/sparkdown/"
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
