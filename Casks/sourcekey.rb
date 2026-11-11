cask "sourcekey" do
  version "0.1"
  sha256 "67da213c10ea9c9a76ca6d2cf91f09fdd4be8baa5cfd7ab7e31700b5256a0831"

  url "https://github.com/geragarazagh/sourcekey/releases/download/v#{version}/SourceKey.dmg"
  name "SourceKey"
  desc "Retypes text typed in the wrong keyboard layout"
  homepage "https://geragaraza.com/apps/sourcekey/"

  livecheck do
    url "https://github.com/geragarazagh/sourcekey/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "SourceKey.app"

  uninstall quit: "com.geragaraza.sourcekey"

  zap trash: [
    "~/Library/Application Support/SourceKey",
    "~/Library/Preferences/com.geragaraza.sourcekey.plist",
  ]
end
