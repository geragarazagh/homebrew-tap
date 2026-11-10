cask "stt" do
  version "0.5"
  sha256 "f3a0fad745c5eb06211a89bff8e2e5a9e8442660013687963e0f7b02ea07e27b"

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
