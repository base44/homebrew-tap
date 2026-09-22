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
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-arm64.tar.gz"
      sha256 "272b8c951f393e3b2b9569bdb42c849427dddf04e2ece9d27d9fcce4abcb2750"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-x64.tar.gz"
      sha256 "e4e9c194934bd82d94efa0ec71e5d9d076512d653cf151ccb4c873979c61bed5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-arm64.tar.gz"
      sha256 "028581831bdc7c319c69f3c85ca58858a1d4649fc9eb7c26767f9e632c91c0f1"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-x64.tar.gz"
      sha256 "dc8a3bbc41d532bb82aa02cf611636194ff606ba628303c068f8585877e85cd5"
    end
  end

  def install
    bin.install "base44"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/base44 --version")
  end
end
