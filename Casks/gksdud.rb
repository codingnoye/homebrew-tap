cask "gksdud" do
  version "2.0.0"
  sha256 "05eeebbedd1e16c4fc1ce92192a4e9c949dd3e344ab2f2ffb951099a865b50d8"

  url "https://github.com/codingnoye/gksdud/releases/download/v#{version}/gksdud-#{version}.zip"
  name "gksdud"
  desc "Korean-English input switching from the menu bar"
  homepage "https://github.com/codingnoye/gksdud"

  depends_on macos: :ventura

  app "gksdud.app"

  uninstall quit: "io.gksdud.inputswitch"

  caveats <<~EOS
    Updating from 1.8.0 or earlier asks for Accessibility once more, as the app is now signed by Apple.
    Accessibility permission is required for switching on key press.
    If Homebrew cannot quit gksdud, quit it normally to restore keyboard settings.
  EOS
end
