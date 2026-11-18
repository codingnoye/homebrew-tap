cask "gksdud" do
  version "2.2.0"
  sha256 "9e20f3ff3a0593f962bdbeefceb99f88671d67c6f932c4344c9c2876326a3292"

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
