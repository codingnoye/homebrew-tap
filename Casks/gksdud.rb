cask "gksdud" do
  version "0.5.12"
  sha256 "5846df9d78905910937c61be6d4f4b4738077c7906478d68757e31bd209206f1"

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
