cask "holdq" do
  version "0.3"
  sha256 "f9d49df29c4f96dccc545ffdd0c05e65df9f1391d3e17e5a601d21befd4d7eae"

  url "https://github.com/geragarazagh/holdq/releases/download/v#{version}/HoldQ.dmg"
  name "HoldQ"
  desc "Quit protection"
  homepage "https://geragaraza.com/apps/holdq/"

  livecheck do
    url "https://github.com/geragarazagh/holdq/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "HoldQ.app"
  binary "#{appdir}/HoldQ.app/Contents/MacOS/HoldQ", target: "holdq-cli"

  uninstall quit: "com.geragaraza.holdq"

  zap trash: "~/Library/Preferences/com.geragaraza.holdq.plist"
end
