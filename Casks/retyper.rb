cask "retyper" do
  version "0.1.2"
  sha256 "2a8e2e869b66dfb99c1976073d208cae6a1876178b0df62db8bbadb8ce8ed430"

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
