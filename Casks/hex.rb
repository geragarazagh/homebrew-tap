cask "hex" do
  version "0.4"
  sha256 "4b49750687c71a1f685cb030efe3eba8941a0b6f77455dcf75bb70e7d899d9f9"

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
