cask "hex" do
  version "0.3"
  sha256 "c1cd345918e20ddfc6f7b465314313b69956ec1783f8d0b01b0ab463c9de584a"

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
