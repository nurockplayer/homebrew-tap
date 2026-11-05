cask "tachiko-sheet" do
  version "0.1.0-preview.5"
  sha256 "d9181aee892789a50db2f3c2b906633fccc94e637208183ce77fe049a7c8ac57"

  url "https://github.com/nurockplayer/tachiko-sheet/releases/download/v#{version}/Tachiko-Sheet-v#{version}-macos-arm64.dmg"
  name "Tachiko Sheet"
  desc "Spreadsheet with checked tables and formulas"
  homepage "https://github.com/nurockplayer/tachiko-sheet"

  # Previews are GitHub pre-releases, which livecheck's latest-release strategy
  # cannot see. Tachiko Sheet's release workflow updates this cask instead.
  livecheck do
    skip "Updated by the Tachiko Sheet release workflow"
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Tachiko Sheet.app"

  zap trash: [
    "~/Library/Caches/dev.tachiko.sheet",
    "~/Library/Preferences/dev.tachiko.sheet.plist",
    "~/Library/WebKit/dev.tachiko.sheet",
  ]

  caveats <<~EOS
    Tachiko Sheet is ad-hoc signed and not notarized by Apple, so macOS blocks
    the first launch. To allow it, try to open the app once, then go to
    System Settings > Privacy & Security and choose Open Anyway.

    If Open Anyway does not appear, and you trust this source, you can remove
    the quarantine flag from this app only:

      xattr -dr com.apple.quarantine "/Applications/Tachiko Sheet.app"

    Do not turn Gatekeeper off system-wide.
  EOS
end
