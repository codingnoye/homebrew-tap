cask "gksdud" do
  version "1.7.0"
  sha256 "fbf76f5de8ae27a6abab863553e28e6a82c1b179a54852dc705964bb65a09be4"

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
