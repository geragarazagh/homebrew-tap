cask "holdq" do
  version "0.2"
  sha256 "cbdb8d202798300a8071874f928956d21b031836e62bf0b1a09c90d6a77e0b4a"

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
