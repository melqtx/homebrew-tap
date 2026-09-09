class Xeet < Formula
  desc "Terminal interface for browsing and posting to X.com"
  homepage "https://github.com/melqtx/xeet"
  url "https://github.com/melqtx/xeet/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "acdab9bf4993f480c68bd963aec037382259270c4121d3a6d6e2e00086db23cd"
  license "MIT"
  head "https://github.com/melqtx/xeet.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "xeet #{version}", shell_output("#{bin}/xeet version")
  end
end
