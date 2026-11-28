cask "fully" do
  version "0.3"
  sha256 "bd07b8d98dc08a6ea551b4f5f30c764c067c58978da85b9dcc81fe7adefec561"

  url "https://github.com/geragarazagh/fully/releases/download/v#{version}/Fully.dmg"
  name "Fully"
  desc "Window maximizer"
  homepage "https://geragaraza.com/apps/fully/"

  livecheck do
    url "https://github.com/geragarazagh/fully/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Fully.app"
  binary "#{appdir}/Fully.app/Contents/MacOS/Fully", target: "fully-cli"

  uninstall quit: "com.geragaraza.fully"

  zap launchctl: "com.geragaraza.fully.login",
      trash:     "~/Library/Preferences/com.geragaraza.fully.plist"
end
