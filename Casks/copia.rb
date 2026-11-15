cask "copia" do
  version "0.1"
  sha256 "b1326b42dbfebe0beec7f6498a0ffa4576e0e1e4f2f52d59ba50cb7f72821a83"

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
