cask "pixlift" do
  version "0.4"
  sha256 "2951f2def158b291a0ccae0cfbd0366d17c36495f3fdbc1d3251a02c4a47c33f"

  url "https://github.com/geragarazagh/pixlift/releases/download/v#{version}/Pixlift.dmg"
  name "Pixlift"
  desc "Screenshots and screen recording"
  homepage "https://geragaraza.com/apps/pixlift/"

  livecheck do
    url "https://github.com/geragarazagh/pixlift/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Pixlift.app"
  binary "#{appdir}/Pixlift.app/Contents/MacOS/Pixlift", target: "pixlift-cli"

  uninstall quit: "com.geragaraza.pixlift"

  zap trash: [
    "~/Library/Caches/com.geragaraza.pixlift",
    "~/Library/Preferences/com.geragaraza.pixlift.plist",
  ]
end
