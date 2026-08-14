cask "relu" do
  version "0.1.5"
  sha256 "83f5524052374725f15d323a881fd413689986b2f2d83dc2c168f47e0dbb755d"

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
