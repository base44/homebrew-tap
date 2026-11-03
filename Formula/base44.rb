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
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-arm64.tar.gz"
      sha256 "29d3cefcbf54f8995b070c7496dd57ca48bf28259bb4e0551fed3cf2e45c6653"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-x64.tar.gz"
      sha256 "f6389919d5ce3f21c2683442ac5e928e831056fb1d595cb65ae814d31a340f84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-arm64.tar.gz"
      sha256 "7f8e1f4b99a64133937146558c9f188bda91faeeedf6521d950e56b5f8888e2b"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-x64.tar.gz"
      sha256 "79d7a062d7356f6ddb8a1bac980d2c32587be0056c96695689b36aafc830f8cb"
    end
  end

  def install
    bin.install "base44"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/base44 --version")
  end
end
