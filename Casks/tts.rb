cask "tts" do
  version "0.3"
  sha256 "0dbcce74d202eddbf631119b78b61a4660371f2b0ed2a0cd209721272b757ca7"

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
