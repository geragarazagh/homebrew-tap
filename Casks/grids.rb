cask "grids" do
  version "1.3"
  sha256 "69bc13b06787c1787d57cb8f4c8fe083af9d4baba33ce5b3dbb422c38825f431"

  url "https://github.com/geragarazagh/grids/releases/download/v#{version}/Grids.dmg"
  name "Grids"
  desc "Grid overlay for checking layout and proportion on the screen"
  homepage "https://geragaraza.com/apps/grids/"

  livecheck do
    url "https://github.com/geragarazagh/grids/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Grids.app"

  uninstall quit: "com.geragaraza.grids"

  zap trash: "~/Library/Preferences/com.geragaraza.grids.plist"
end
