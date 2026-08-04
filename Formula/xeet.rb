class Xeet < Formula
  desc "Terminal interface for browsing and posting to X.com"
  homepage "https://github.com/melqtx/xeet"
  url "https://github.com/melqtx/xeet/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "921f856d19cbff87529bb72d7d98a4aa7a4f237531afa9d2a9158cef10111d95"
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
