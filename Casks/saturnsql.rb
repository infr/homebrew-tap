cask "saturnsql" do
  arch arm: "-arm64"

  version "0.1.1"
  sha256 arm:   "f58c98aed86474ea85b20f796e1c00501afc26014f759b42fe3286c932d58f35",
         intel: "cd775b417437125d37fc2be513cbedf5c6c9e13d7f8646754838f262fea18d35"

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
