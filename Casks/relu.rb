cask "relu" do
  version "0.3.0"
  sha256 "841a9d43621ef3e2f388b4494fcfec68985df651eeed905a9742ded5fd0bc8e9"

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
