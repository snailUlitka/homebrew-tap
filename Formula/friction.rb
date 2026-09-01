class Friction < Formula
  include Language::Python::Virtualenv

  desc "Local-first workflow-friction tracker"
  homepage "https://github.com/snailUlitka/friction"
  url "https://github.com/snailUlitka/friction/releases/download/v0.1.0/friction-0.1.0.tar.gz"
  sha256 "48422e64918a191d3f53bbf3a7bd22cc259d06b6aecf77ff075586c82e7e55e3"
  license "MIT"
  head "https://github.com/snailUlitka/friction.git", branch: "main"

  depends_on "rust" => :build # for uv_build > maturin
  depends_on "certifi" => :no_linkage
  depends_on "cryptography" => :no_linkage
  depends_on "pydantic" => :no_linkage
  depends_on "python@3.14"
  depends_on "rpds-py" => :no_linkage

  pypi_packages exclude_packages: %w[certifi cryptography pydantic rpds-py]

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/friction --version")

    database = testpath/"friction.db"
    system bin/"friction", "--db", database, "add", "Homebrew formula test"
    assert_match "Homebrew formula test", shell_output("#{bin}/friction --db #{database} list")
    assert_match '"ok":true', shell_output("#{bin}/friction --db #{database} doctor --output json")

    system libexec/"bin/python", "-c", "import friction.interfaces.mcp; import friction.interfaces.tui"
  end
end
