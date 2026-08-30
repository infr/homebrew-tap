cask "saturnsql" do
  arch arm: "-arm64"

  version "0.1.2"
  sha256 arm:   "474bf985adaeef9249603cb75552380d05e73e0eadb87df9e98685e55c4fe248",
         intel: "895710a37a1084bfb7fa1ae80611cb4c413d02e4811d27c226efd285de3d2ea9"

  url "https://saturnsql.com/downloads/desktop/SaturnSQL-#{version}#{arch}.dmg"
  name "SaturnSQL"
  desc "SQL client for teams with scheduled exports to Google Sheets and Slack"
  homepage "https://saturnsql.com/"

  livecheck do
    url "https://saturnsql.com/downloads/desktop/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: :ventura

  app "SaturnSQL.app"

  zap trash: [
    "~/Library/Application Support/SaturnSQL",
    "~/Library/Caches/com.saturnsql.desktop",
    "~/Library/HTTPStorages/com.saturnsql.desktop",
    "~/Library/Logs/SaturnSQL",
    "~/Library/Preferences/com.saturnsql.desktop.plist",
    "~/Library/Saved Application State/com.saturnsql.desktop.savedState",
  ]

  caveats <<~EOS
    SaturnSQL is ad-hoc signed, not notarized. macOS blocks the first
    launch: open the app once, then allow it under
    System Settings → Privacy & Security → "Open Anyway", and launch again.
  EOS
end
