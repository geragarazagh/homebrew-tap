cask "holdq" do
  version "0.1"
  sha256 "1419c4d10dea18997729c1b26b47bb2dd2bd6e034029863caa2b75ea970cd5d8"

  url "https://github.com/geragarazagh/holdq/releases/download/v#{version}/HoldQ.dmg"
  name "HoldQ"
  desc "Makes Command-Q quit an app only when held for a second"
  homepage "https://geragaraza.com/apps/holdq/"

  livecheck do
    url "https://github.com/geragarazagh/holdq/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "HoldQ.app"

  uninstall quit: "com.geragaraza.holdq"

  zap trash: "~/Library/Preferences/com.geragaraza.holdq.plist"
end
