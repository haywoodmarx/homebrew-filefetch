class Filefetch < Formula
  desc "MCP tool for Claude Code that queries local files using a small, fast model"
  homepage "https://github.com/haywoodmarx/filefetch"
  url "https://github.com/haywoodmarx/filefetch/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e22070d5ed61ef48cb6df50a0fda273685e28e0526bb979373ffc368b0890337"
  version "1.0.0"

  depends_on "node"

  def install
    libexec.install "server.ts", "lib.ts", "package.json"
    system "npm", "install", "--prefix", libexec.to_s, "--production", "--no-audit", "--no-fund"
    bin.install "bin/filefetch-core"
    bin.install "bin/filefetch-setup"
  end

  def caveats
    <<~EOS
      Register FileFetch with Claude Code:
        claude mcp add --scope user FileFetch filefetch-core

      Then restart Claude Code.
    EOS
  end

  test do
    assert_predicate libexec/"server.ts", :exist?
    assert_predicate libexec/"lib.ts", :exist?
    assert_predicate libexec/"node_modules/@modelcontextprotocol", :exist?
  end
end
