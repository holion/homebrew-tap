cask "sourcegit-holion" do
  arch arm: "arm64", intel: "x64"

  version "2026.21.2"
  sha256 arm:   "2f5e879a28ac4c441bd0c8f9142ad88046c80e7bcf83f2098d1f7f476baba41d",
         intel: "d4f4b030b18d06fe71878c41460ace095948407c236c9c8eece84fae846a4a12"

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
  depends_on macos: ">= :ventura"

  app "SourceGit.app"

  # Builds made without the signing secrets are not notarized, so strip the quarantine flag for those.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/SourceGit.app"]
  end
end
