class Purra < Formula
  desc "High-performance Unicode scalar-to-text replacement engine and CLI"
  homepage "https://github.com/snailUlitka/purra"
  url "https://github.com/snailUlitka/purra/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "4003ac4855685bbb9d198042ca589f452310b8208c2c307df5eafb5d41359988"
  license "MIT"
  head "https://github.com/snailUlitka/purra.git", branch: "main"

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
