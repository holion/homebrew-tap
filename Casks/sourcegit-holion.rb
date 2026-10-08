cask "sourcegit-holion" do
  arch arm: "arm64"

  version "2026.21.11"
  sha256 "e8ccc185d5667b877217ee71f78c9152fac307accc6e6acd3ef77aef80fe37be"

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
