cask "fully" do
  version "0.1"
  sha256 "1a6673a8c6a90b8af6df762155390e9bd7dc0c8b8d992f0284bcab49bb6b3ddb"

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

  uninstall quit: "com.geragaraza.fully"

  zap launchctl: "com.geragaraza.fully.login",
      trash:     "~/Library/Preferences/com.geragaraza.fully.plist"
end
