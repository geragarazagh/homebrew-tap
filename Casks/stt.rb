cask "stt" do
  version "0.7"
  sha256 "015e0eb37aed76531e52e123d770dea9a14a0ca4beeacb05da36dfda87219cb5"

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
