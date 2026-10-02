cask "sourcegit-holion" do
  arch arm: "arm64", intel: "x64"

  version "2026.21.1"
  sha256 arm:   "4682a01b9e33908d125eb12c433a528877d94e71db7247333e77919bd17bc2a3",
         intel: "b9029898f40492e2b4a536e75cb1f4f381efbac0c0533bfa9fd8e46ffe324737"

  url "https://github.com/holion/sourcegit/releases/download/v#{version}/sourcegit_#{version}.osx-#{arch}.zip"
  name "SourceGit (Holion)"
  desc "Holion fork of the SourceGit Git GUI client"
  homepage "https://github.com/holion/sourcegit"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "sourcegit"
  depends_on macos: ">= :ventura"

  app "SourceGit.app"

  # The app is not notarized, so strip the quarantine flag to keep Gatekeeper from blocking it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/SourceGit.app"]
  end
end
