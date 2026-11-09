cask "ocr" do
  version "0.3"
  sha256 "7770f54aa88dd093a17c5efe7189a9b4f04683df8bb757153dd031da71ea0d9a"

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
