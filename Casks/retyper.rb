cask "retyper" do
  version "0.2"
  sha256 "1d0984afde47fca13b364248d3c975353bf3d1180944f9261895fc8d4eec284c"

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

  uninstall quit: "com.geragaraza.sourcekey"

  zap trash: [
    "~/Library/Application Support/Retyper",
    "~/Library/Application Support/SourceKey",
    "~/Library/Preferences/com.geragaraza.sourcekey.plist",
  ]
end
