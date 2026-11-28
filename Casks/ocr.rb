cask "ocr" do
  version "0.6"
  sha256 "e8c8a517cd7c74a5fa9a775e02c86d0fe16a90d96f56be1580fea2858ed4c1d3"

  url "https://github.com/geragarazagh/ocr/releases/download/v#{version}/OCR.dmg"
  name "OCR"
  desc "Screen text recognition"
  homepage "https://geragaraza.com/apps/ocr/"

  livecheck do
    url "https://github.com/geragarazagh/ocr/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OCR.app"
  binary "#{appdir}/OCR.app/Contents/MacOS/OCR", target: "ocr-cli"

  uninstall quit: "com.geragaraza.ocr"

  zap trash: [
    "~/Library/Caches/com.geragaraza.ocr",
    "~/Library/Preferences/com.geragaraza.ocr.plist",
  ]
end
