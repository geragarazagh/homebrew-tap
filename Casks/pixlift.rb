cask "pixlift" do
  version "0.3"
  sha256 "e060eb5be1e20a28bbc34bc9d639520f598a5ffe780a6843cc254cf7a7222471"

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
