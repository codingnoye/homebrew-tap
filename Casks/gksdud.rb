cask "gksdud" do
  version "1.1.1"
  sha256 "a363e03028c49e0bf60a466b9556aeeb9b8832865049cf5b634ba5aae69f2301"

  url "https://github.com/codingnoye/gksdud/releases/download/v#{version}/gksdud-#{version}-macos-universal.zip"
  name "gksdud"
  desc "Korean-English input switching from the menu bar"
  homepage "https://github.com/codingnoye/gksdud"

  depends_on macos: ">= :ventura"

  app "gksdud.app"

  caveats <<~EOS
    This build is self-signed and is not notarized by Apple.
    macOS may block its first launch. No security settings are changed by this cask.
    Accessibility permission is required for switching on key press.
    Quit gksdud normally before upgrading or uninstalling to restore keyboard settings.
  EOS
end
