cask "tts" do
  version "0.4"
  sha256 "7b0cb5bc1bb15ab4ae97aa7955ab20a4faaa5604c451f282e01b3021127d0555"

  url "https://github.com/geragarazagh/tts/releases/download/v#{version}/TTS.dmg"
  name "TTS"
  desc "Text to speech with Siri and other system voices"
  homepage "https://geragaraza.com/apps/tts/"

  livecheck do
    url "https://github.com/geragarazagh/tts/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "TTS.app"

  uninstall quit: "com.geragaraza.tts"

  zap trash: [
    "~/Library/Application Support/TTS",
    "~/Library/Preferences/com.geragaraza.tts.plist",
  ]
end
