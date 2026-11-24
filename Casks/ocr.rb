cask "ocr" do
  version "0.5"
  sha256 "93abaf554a23f1256fbfcdd12ebb7cf25c7e5104d4f133a4a2f1fe9a6b81b415"

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
