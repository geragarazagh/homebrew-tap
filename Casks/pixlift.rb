cask "pixlift" do
  version "0.1"
  sha256 "dad1502664bbba5d352807ad2d71e6d2a53b45b785b1b96288c1e6a092288168"

  url "https://github.com/geragarazagh/pixlift/releases/download/v#{version}/Pixlift.dmg"
  name "Pixlift"
  desc "Screenshots and screen recording to the Desktop and the clipboard at once"
  homepage "https://geragaraza.com/apps/pixlift/"

  livecheck do
    url "https://github.com/geragarazagh/pixlift/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Pixlift.app"

  uninstall quit: "com.geragaraza.pixlift"

  zap trash: [
    "~/Library/Caches/com.geragaraza.pixlift",
    "~/Library/Preferences/com.geragaraza.pixlift.plist",
  ]
end
