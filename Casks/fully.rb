cask "fully" do
  version "0.2"
  sha256 "9a7e8aa18ba4f96af69ccdb9e911f28a20b825bfce004625bc4578dd7606f962"

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
