cask "hex" do
  version "0.2"
  sha256 "32bf67eb8cf9e4739ef9b47e5c7770201c412e2182c531ef2925c5973b63d848"

  url "https://github.com/geragarazagh/hex/releases/download/v#{version}/HEX.dmg"
  name "#HEX"
  desc "Color picker that copies any pixel of the screen as a HEX code"
  homepage "https://geragaraza.com/apps/hex/"

  livecheck do
    url "https://github.com/geragarazagh/hex/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "#HEX.app"

  uninstall quit: "com.geragaraza.hex"

  zap trash: "~/Library/Preferences/com.geragaraza.hex.plist"
end
