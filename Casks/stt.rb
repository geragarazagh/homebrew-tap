cask "stt" do
  version "0.10"
  sha256 "10568b68b38631133fae4071cf8cb313f9dab1add1480f8d4be38337d4e9a452"

  url "https://github.com/geragarazagh/stt/releases/download/v#{version}/STT.dmg"
  name "STT"
  desc "Dictation"
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
