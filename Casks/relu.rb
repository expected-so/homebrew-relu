cask "relu" do
  version "0.2.2"
  sha256 "340ab56ff2a7a703aec2e0febff959c19a02256504407f88656b3a91e4e83171"

  url "https://github.com/expected-so/homebrew-relu/releases/download/v#{version}/relu_#{version}_universal.dmg"
  name "Relu"
  desc "Keyboard-first native code review app"
  homepage "https://getrelu.app"

  depends_on macos: :ventura

  app "relu.app"

  # Relu isn't notarized yet, so Gatekeeper quarantines it on first launch.
  # Clear the quarantine attribute so `brew install --cask relu` "just works".
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/relu.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/app.getrelu",
    "~/Library/Caches/app.getrelu",
    "~/Library/Preferences/app.getrelu.plist",
    "~/Library/Saved Application State/app.getrelu.savedState",
  ]
end
