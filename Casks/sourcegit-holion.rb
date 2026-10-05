cask "sourcegit-holion" do
  arch arm: "arm64"

  version "2026.21.3"
  sha256 "12ace9937ce437922f35dcf123146eb154b765ba52123ff25198f0b69401be48"

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
