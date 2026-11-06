cask "gksdud" do
  version "2.1.1"
  sha256 "3390de498d3e4283b90691beeabf530faf0893fb0c54ef623cd9ecfa66e29c84"

  url "https://github.com/codingnoye/gksdud/releases/download/v#{version}/gksdud-#{version}.zip"
  name "gksdud"
  desc "Korean-English input switching from the menu bar"
  homepage "https://gksdud.noye.dev"

  depends_on macos: :ventura

  app "gksdud.app"

  uninstall quit: "io.gksdud.inputswitch"

  caveats <<~EOS
    Accessibility permission is required for switching on key press.
    If Homebrew cannot quit gksdud, quit it normally to restore keyboard settings.
  EOS
end
