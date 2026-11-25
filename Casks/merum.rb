cask "merum" do
  version "0.1"
  sha256 "648f592d2e51109391e93cedbf63b0d5fff6c127a08920a71b9ecffcd616760c"

  url "https://github.com/geragarazagh/merum/releases/download/v#{version}/Merum.dmg"
  name "Merum"
  desc "Plain-text notes"
  homepage "https://geragaraza.com/apps/merum/"

  livecheck do
    url "https://github.com/geragarazagh/merum/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Merum.app"
  binary "#{appdir}/Merum.app/Contents/MacOS/Merum", target: "merum-cli"

  uninstall quit: "com.geragaraza.merum"

  zap launchctl: "com.geragaraza.merum.login",
      trash:     [
        "~/Library/Application Support/Merum",
        "~/Library/Caches/CloudKit/com.geragaraza.merum",
        "~/Library/Caches/com.geragaraza.merum",
        "~/Library/Preferences/com.geragaraza.merum.plist",
      ]
end
