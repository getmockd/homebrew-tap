class Mockd < Formula
  desc "High-performance multi-protocol API mocking server"
  homepage "https://mockd.io"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-arm64"
      sha256 "e3d227da8e71c6e404c8ad5dca915a193241453be7ae3ce77566f262c06d7862"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-amd64"
      sha256 "b97149a8808597d321367123a4339937710cfa5e9f3333f92027e65bceaeb5cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-arm64"
      sha256 "a730401a93d8ea188710293c2a93ba38a87f4f087901e0bab618ca88877d5652"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-amd64"
      sha256 "49978ab297068b143946827aeea34eebb628c2293079c457963d7546febc6d1e"
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
