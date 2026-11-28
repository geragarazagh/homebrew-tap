cask "copia" do
  version "0.4"
  sha256 "f4907ead1340205b80137e79f7f7b7b5363498ea28d7a5f02e4317ae17b64cfb"

  url "https://github.com/geragarazagh/copia/releases/download/v#{version}/Copia.dmg"
  name "Copia"
  desc "Clipboard manager"
  homepage "https://geragaraza.com/apps/copia/"

  livecheck do
    url "https://github.com/geragarazagh/copia/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Copia.app"
  binary "#{appdir}/Copia.app/Contents/MacOS/Copia", target: "copia-cli"

  uninstall quit: "com.geragaraza.copia"

  zap trash: [
    "~/.local/share/copia",
    "~/Library/Preferences/com.geragaraza.copia.plist",
  ]
end
