cask "hex" do
  version "0.5"
  sha256 "08d8d381fc0f86f5dda8722c4174efd4361e1b459f21b981979f15d285cadc23"

  url "https://github.com/geragarazagh/hex/releases/download/v#{version}/HEX.dmg"
  name "#HEX"
  desc "Color picker"
  homepage "https://geragaraza.com/apps/hex/"

  livecheck do
    url "https://github.com/geragarazagh/hex/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "#HEX.app"
  binary "#{appdir}/#HEX.app/Contents/MacOS/HEX", target: "hex-cli"

  uninstall quit: "com.geragaraza.hex"

  zap trash: "~/Library/Preferences/com.geragaraza.hex.plist"
end
