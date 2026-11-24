cask "grids" do
  version "1.4"
  sha256 "edee7eb0dc95a502bb27b3f649edc9c8323fb808108cf4a69574e428c37c9258"

  url "https://github.com/geragarazagh/grids/releases/download/v#{version}/Grids.dmg"
  name "Grids"
  desc "Grid overlay"
  homepage "https://geragaraza.com/apps/grids/"

  livecheck do
    url "https://github.com/geragarazagh/grids/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Grids.app"
  binary "#{appdir}/Grids.app/Contents/MacOS/Grids", target: "grids-cli"

  uninstall quit: "com.geragaraza.grids"

  zap trash: "~/Library/Preferences/com.geragaraza.grids.plist"
end
