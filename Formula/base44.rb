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
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-arm64.tar.gz"
      sha256 "cc92f88716bd1e93a1b64c7c12d155e9162acd951f98d3558f2016c2a67b5013"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-x64.tar.gz"
      sha256 "6b192213d7699028051effb0f905af6b72dbe74912c951e9d77f4d46cf7f6286"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-arm64.tar.gz"
      sha256 "1d1dd556204c2e75a347c0e515ab3ed3b87fc6c644d6913cc8aea864edff38d3"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-x64.tar.gz"
      sha256 "7493f51efe93566be329520e109f345c0c2d5406476e17e4a56ab9fcc3d10da2"
    end
  end

  def install
    bin.install "base44"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/base44 --version")
  end
end
