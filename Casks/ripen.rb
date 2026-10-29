cask "ripen" do
  version "0.1.0"
  sha256 "90166adce26204f2f2c0370bf45fabe56f323a44606d2f21db8bb47cb0124d01"

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
