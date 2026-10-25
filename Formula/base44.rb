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
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-arm64.tar.gz"
      sha256 "b1a468278c22ba0fe4e650efb2a040e655e34c3289dc8748ec6dcf3b6cf990c4"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-darwin-x64.tar.gz"
      sha256 "9c63b6507303a6dd712a438875c25fe8fee85d9cb9a4773df4efacb136f4fe43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-arm64.tar.gz"
      sha256 "b6aff4eb40301e2def9a8602d1b3c59707897a63532513d0bd12a52ff7781c5c"
    else
      url "https://github.com/base44/cli/releases/download/v#{version}/base44-linux-x64.tar.gz"
      sha256 "acbd86fa01366a94afd6224d549792b91826f6356a358a35a6be55e517d2d41e"
    end
  end

  def install
    bin.install "base44"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/base44 --version")
  end
end
