cask "holdq" do
  version "0.4"
  sha256 "d46aac9abe2cdcfec6effa75a1d23be89f2e08137703e03e8679df6cb1c534b6"

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
