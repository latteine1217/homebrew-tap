cask "ripen" do
  version "0.2.5"
  sha256 "8f8f1c74fcd70f5dab2819aa821039197dbb7ed06a29b8c3dcd59de7e9c248b1"

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
