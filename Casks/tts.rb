cask "tts" do
  version "0.1"
  sha256 "615b610679821cce259d833665a7267f46723caab7ca9a146bb8f098dd53d8e3"

  url "https://github.com/geragarazagh/tts/releases/download/v#{version}/TTS.dmg"
  name "TTS"
  desc "Offline text to speech with Supertonic voices"
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
