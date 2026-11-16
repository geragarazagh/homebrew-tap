cask "ocr" do
  version "0.4"
  sha256 "230a77970fcda459ad6c02b0e38a006d2849c538d467d957e7488431ab0c5717"

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
