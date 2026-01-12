cask "cf-zone-status" do
  version "1.0.0"
  sha256 :no_check

  url "https://github.com/sheyam/cf-zone-status/releases/download/v#{version}/cf-zone-status-v1.0.0.zip"
  name "Cloudflare Zone Status"
  desc "macOS menu bar app for monitoring Cloudflare zones with security analytics"
  homepage "https://github.com/sheyam/cf-zone-status"

  livecheck do
    url :homepage
    strategy :github_latest
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on macos: ">= :ventura"

  app "cf-zone-status.app"

  zap trash: [
    "~/Library/Preferences/sheyam.cf-zone-status.plist",
    "~/Library/Application Support/cf-zone-status",
  ]
end

