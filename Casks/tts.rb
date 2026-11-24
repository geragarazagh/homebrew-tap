cask "tts" do
  version "0.8"
  sha256 "a2920ab74ce4797b54763618d60149d6df1cd74ca3e542ed5d6066357917b350"

  url "https://github.com/geragarazagh/tts/releases/download/v#{version}/TTS.dmg"
  name "TTS"
  desc "Text to speech"
  homepage "https://geragaraza.com/apps/tts/"

  livecheck do
    url "https://github.com/geragarazagh/tts/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "TTS.app"
  binary "#{appdir}/TTS.app/Contents/Resources/tts", target: "tts"

  uninstall quit: "com.geragaraza.tts"

  zap trash: [
    "~/Library/Application Support/TTS",
    "~/Library/Preferences/com.geragaraza.tts.plist",
  ]
end
