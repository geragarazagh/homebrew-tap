cask "ocr" do
  version "0.2"
  sha256 "32ab77aaf062d4f4d8a9da40cb56c2bad24b0a0addc61e658f345b45abac8a0b"

  url "https://github.com/geragarazagh/ocr/releases/download/v#{version}/OCR.dmg"
  name "OCR"
  desc "Screen text and QR code recognition to the clipboard"
  homepage "https://geragaraza.com/apps/ocr/"

  livecheck do
    url "https://github.com/geragarazagh/ocr/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OCR.app"

  uninstall quit: "com.geragaraza.ocr"

  zap trash: [
    "~/Library/Caches/com.geragaraza.ocr",
    "~/Library/Preferences/com.geragaraza.ocr.plist",
  ]
end
