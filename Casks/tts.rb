cask "tts" do
  version "0.2"
  sha256 "4035a70a1649c33fc18f61ae14cb8cb728c8ac3d7b566f7433b2addbc35a2d3b"

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
