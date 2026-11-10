cask "ripen" do
  version "0.3.1"
  sha256 "4a2685b426020901722ef9d3306abe6c350ba63bd5dce539fa5a3ead81776cd7"

  url "https://github.com/latteine1217/ripen/releases/download/v#{version}/Ripen-#{version}.dmg"
  name "Ripen"
  desc "Pomodoro timer with a floating window and a notch island"
  homepage "https://latteine1217.github.io/ripen/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Ripen.app"

  zap trash: [
    "~/Library/Application Support/Ripen",
    "~/Library/Preferences/com.latteine.ripen.plist",
  ]

  caveats <<~EOS
    Ripen is not notarized by Apple, so macOS blocks the first launch.
    Open it once from System Settings › Privacy & Security › Open Anyway
    (on macOS 14, Control-click Ripen in Applications and choose Open).
  EOS
end
