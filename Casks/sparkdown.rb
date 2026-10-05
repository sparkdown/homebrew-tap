# SparkDown is ad-hoc signed (not notarized). On first launch macOS may block it:
# right-click Open, or System Settings > Privacy & Security > Open Anyway.
cask "sparkdown" do
  version "0.3.1"
  sha256 "ab97d1572e01b601d36e33ad57228985c74d54961dae0e08c1bbb18867cfd63c"

  url "https://github.com/sparkdown/sparkdown/releases/download/v#{version}/SparkDown_#{version}_aarch64.dmg"
  name "SparkDown"
  desc "A small markdown editor for you and your coding agents"
  homepage "https://sparkdown.dev/"

  # Apple Silicon only. There is no Intel URL.
  depends_on arch: :arm64
  depends_on macos: ">= :catalina"

  app "SparkDown.app"
end
