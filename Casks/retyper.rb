cask "retyper" do
  version "0.3"
  sha256 "6450c9a381f1eb9802ec8b6ecaf89b2176bd709c2cff0620dcee03ba2b870786"

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
