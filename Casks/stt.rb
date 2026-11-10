cask "stt" do
  version "0.3"
  sha256 "86ec89048ba767fe4d4eeb4aa02c339dc3e243fc561cacc4e298d06d5c3795ad"

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

  uninstall quit: "com.geragaraza.stt"

  zap trash: [
    "~/Library/Application Support/STT",
    "~/Library/Preferences/com.geragaraza.stt.plist",
  ]
end
