cask "gksdud" do
  version "1.4.0"
  sha256 "41b2f8115136896585c5a6a940c9b2e33d940e67a994a24a702c72de145ef819"

  url "https://github.com/codingnoye/gksdud/releases/download/v#{version}/gksdud-#{version}-macos-universal.zip"
  name "gksdud"
  desc "Korean-English input switching from the menu bar"
  homepage "https://github.com/codingnoye/gksdud"

  depends_on macos: :ventura

  app "gksdud.app"

  uninstall quit: "io.gksdud.inputswitch"

  caveats <<~EOS
    This build is self-signed and is not notarized by Apple.
    macOS may block its first launch. No security settings are changed by this cask.
    Accessibility permission is required for switching on key press.
    If Homebrew cannot quit gksdud, quit it normally to restore keyboard settings.
  EOS
end
