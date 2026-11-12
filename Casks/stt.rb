cask "stt" do
  version "0.7.1"
  sha256 "9010585b0f8298c063e6ad9617552ac1121887a9744afc0d5a1043f222ebd812"

  url "https://github.com/geragarazagh/stt/releases/download/v#{version}/STT.dmg"
  name "STT"
  desc "Offline dictation with local speech recognition models"
  homepage "https://geragaraza.com/apps/stt/"

  livecheck do
    url "https://github.com/geragarazagh/stt/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "STT.app"
  binary "#{appdir}/STT.app/Contents/MacOS/STT", target: "stt-cli"

  uninstall quit: "com.geragaraza.stt"

  zap trash: [
    "~/Library/Application Support/STT",
    "~/Library/Preferences/com.geragaraza.stt.plist",
  ]
end
