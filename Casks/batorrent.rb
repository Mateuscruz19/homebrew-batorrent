cask "batorrent" do
  version "3.0.0"
  sha256 "6f849a6104770e370b86de56025474bd491b3d919ebf4650488087051ab9504b"

  url "https://github.com/Mateuscruz19/BAT-Torrent/releases/download/v#{version}/BATorrent-macos-arm64.dmg"
  name "BATorrent"
  desc "Open-source BitTorrent client with VPN kill switch, anti-Xunlei, Tor, and 7 languages"
  homepage "https://github.com/Mateuscruz19/BAT-Torrent"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "BATorrent.app"

  # Ad-hoc codesigned (open-source project without Apple Developer ID).
  # Without this, Gatekeeper quarantines the app on first launch.
  caveats <<~EOS
    #{token} is ad-hoc signed. On first launch macOS may show a security warning.
    To allow it: System Settings → Privacy & Security → Open Anyway.
  EOS

  zap trash: [
    "~/Library/Application Support/BATorrent",
    "~/Library/Preferences/com.batorrent.app.plist",
    "~/Library/Saved Application State/com.batorrent.app.savedState",
  ]
end
