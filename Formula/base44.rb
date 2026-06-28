# Homebrew formula template for the Base44 CLI.
#
# CI renders this template with real version + SHA256 values and pushes it
# to base44/homebrew-tap via infra/homebrew/update-tap.sh.
#
# Users install with:
#   brew install base44/tap/base44
#
class Base44 < Formula
  desc "CLI for creating, managing, and deploying Base44 applications"
  homepage "https://github.com/base44/cli"
  version "0.0.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-arm64.tar.gz"
      sha256 "4cb6cb63791a473744986ee5190bc62313ebb4cbcb42c042a25b0e2901249b9c"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-x64.tar.gz"
      sha256 "10e8e79f7fb79a14dd3c333276ce6dc114d18c06978b6d39cdf9977fb01c274a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-arm64.tar.gz"
      sha256 "bd38f4514b63de25b82e474728644b9cbef812523b1579c7160254ae38aa8bab"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-x64.tar.gz"
      sha256 "9d634c4c759cac00b425b64608cd121d3f5696f684fad1bd25f7269354aa0af4"
    end
  end

  def install
    bin.install "base44"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/base44 --version")
  end
end
