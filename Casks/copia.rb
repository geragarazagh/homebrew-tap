cask "copia" do
  version "0.2"
  sha256 "a6fd533c467d2241f42ba2e96213fdfa6f3c17a4f2de692a20bec4befb9f1b18"

  url "https://github.com/geragarazagh/copia/releases/download/v#{version}/Copia.dmg"
  name "Copia"
  desc "Clipboard history: several items pasted at once, or one by one from a queue"
  homepage "https://geragaraza.com/apps/copia/"

  livecheck do
    url "https://github.com/geragarazagh/copia/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Copia.app"

  uninstall quit: "com.geragaraza.copia"

  zap trash: [
    "~/.local/share/copia",
    "~/Library/Preferences/com.geragaraza.copia.plist",
  ]
end
