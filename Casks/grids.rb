cask "grids" do
  version "1.2"
  sha256 "f2461eac9955558b83d2aed0655ad130ec51b5067f9110b46e4747cfb9d5223c"

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
