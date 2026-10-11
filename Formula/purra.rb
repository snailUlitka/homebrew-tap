class Purra < Formula
  desc "High-performance Unicode scalar-to-text replacement engine and CLI"
  homepage "https://github.com/snailUlitka/purra"
  url "https://github.com/snailUlitka/purra/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "0a40a3e243942aae5324bb03e8dda5301dcc569e3f278df8a289e1d7f4610d55"
  license "MIT"
  head "https://github.com/snailUlitka/purra.git", branch: "main"

  bottle do
    root_url "https://github.com/snailUlitka/homebrew-tap/releases/download/purra-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8e1dfc6ef5b9b3e4ff683a783446fa0369bc2107cde6835fb005dbe758a4b380"
    sha256 cellar: :any,                 x86_64_linux: "4183bb7f6d764faaa74998d92f8a56470d3746008d1a6fe9f40014331a75640b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/purra --version")

    input = testpath/"input.txt"
    output = testpath/"output.txt"
    input.write("Purra™\n")
    system bin/"purra", "--in-place-preset", "™=TM", input, output
    assert_equal "PurraTM\n", output.read
  end
end
