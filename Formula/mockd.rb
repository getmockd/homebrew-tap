class Mockd < Formula
  desc "High-performance multi-protocol API mocking server"
  homepage "https://mockd.io"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-arm64"
      sha256 "0453f6efdc6fba5a36fe188929ef43323a2ab0750b6465915e12e7a2c462f5a0"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-amd64"
      sha256 "b0caacb00906720f1be211b2f36fa596fdec52173d37ebe88cc481840ae6231b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-arm64"
      sha256 "59b358847bd69adb15aa1ae0e17aa79d0f2e4f09f7908fc48a8c7e556d43ebbf"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-amd64"
      sha256 "7351c9f94929644b24b89a2aeb3d4e68621b217a40597818a4b1c00ff3136d95"
    end
  end

  def install
    binary = Dir["mockd-*"].first || "mockd"
    bin.install binary => "mockd"
  end

  test do
    assert_match "mockd v#{version}", shell_output("#{bin}/mockd version")
  end
end
