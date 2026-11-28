cask "retyper" do
  version "0.4"
  sha256 "0c142675172f13f4743efe42dd412827b1f658001351ee93592ecb99bdb6959f"

  url "https://github.com/geragarazagh/retyper/releases/download/v#{version}/Retyper.dmg"
  name "Retyper"
  desc "Keyboard layout fixer"
  homepage "https://geragaraza.com/apps/retyper/"

  livecheck do
    url "https://github.com/geragarazagh/retyper/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Retyper.app"
  binary "#{appdir}/Retyper.app/Contents/MacOS/Retyper", target: "retyper-cli"

  uninstall quit: "com.geragaraza.sourcekey"

  zap trash: [
    "~/Library/Application Support/Retyper",
    "~/Library/Application Support/SourceKey",
    "~/Library/Preferences/com.geragaraza.sourcekey.plist",
  ]
end
