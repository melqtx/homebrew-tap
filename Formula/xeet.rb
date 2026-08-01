class Xeet < Formula
  desc "Terminal interface for browsing and posting to X.com"
  homepage "https://github.com/melqtx/xeet"
  url "https://github.com/melqtx/xeet/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "7352a95c575eb60ddf1fb15cb7860909702dc7d6109ab37152aaaf0e3ebc9c66"
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
