cask "copia" do
  version "0.3"
  sha256 "c02d3d5407d027f9982826177a3e8920cc39a368b15b3b4464e6992bb5ea9e06"

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
