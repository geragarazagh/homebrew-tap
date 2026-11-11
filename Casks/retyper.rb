cask "retyper" do
  version "0.1.1"
  sha256 "630a80ed0cf5782603aa39d670e2849fe02bea2c6754bca7ef714781eb18f778"

  url "https://github.com/geragarazagh/retyper/releases/download/v#{version}/Retyper.dmg"
  name "Retyper"
  desc "Retypes text typed in the wrong keyboard layout"
  homepage "https://geragaraza.com/apps/retyper/"

  livecheck do
    url "https://github.com/geragarazagh/retyper/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Retyper.app"

  uninstall quit: "com.geragaraza.sourcekey"

  zap trash: [
    "~/Library/Application Support/Retyper",
    "~/Library/Application Support/SourceKey",
    "~/Library/Preferences/com.geragaraza.sourcekey.plist",
  ]
end
