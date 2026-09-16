cask "gksdud" do
  version "1.0.0"
  sha256 "2e993be3313898dbe73ada319c314e1ebbe15147d11065910bccd00785334b63"

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
