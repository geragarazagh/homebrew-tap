cask "stt" do
  version "0.12"
  sha256 "a4a1de9fa51c930c9e00a0ea844c666e57674b191d4083cb06c41d5c9458efbd"

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
