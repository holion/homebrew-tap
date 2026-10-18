cask "sourcegit-holion" do
  arch arm: "arm64"

  version "2026.21.13"
  sha256 "6ae380026275a51321fa6fa09a31d35bcf6ad143d7487395bec0ac51668dd1cb"

  url "https://github.com/holion/sourcegit/releases/download/v#{version}/sourcegit_#{version}.osx-#{arch}.zip"
  name "SourceGit (Holion)"
  desc "Holion fork of the SourceGit Git GUI client"
  homepage "https://github.com/holion/sourcegit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "sourcegit"
  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "SourceGit.app"

  # Builds made without the signing secrets are not notarized, so strip the quarantine flag for those.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/SourceGit.app"]
  end
end
