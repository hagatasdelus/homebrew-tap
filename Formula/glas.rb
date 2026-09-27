class Glas < Formula
  desc "Git-aware ls command written in Rust"
  homepage "https://github.com/hagatasdelus/glas"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hagatasdelus/glas/releases/download/v0.1.2/glas-0.1.2_arm64_darwin.tar.gz"
      sha256 "fcf18292a1295214f3da0eefbbc189427dc0701f4c852c4f3d29b15fa453e58d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hagatasdelus/glas/releases/download/v0.1.2/glas-0.1.2_amd64_darwin.tar.gz"
      sha256 "19a67a9492627135830c1a53c2f6be501f323d9de55b95432a459c1d068ecfe8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hagatasdelus/glas/releases/download/v0.1.2/glas-0.1.2_arm64_linux.tar.gz"
      sha256 "479e3b7de50a835f23fe6217d1a862b2d704b48d52978a70efa20c1946fc676e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hagatasdelus/glas/releases/download/v0.1.2/glas-0.1.2_amd64_linux.tar.gz"
      sha256 "353bad46e79e20923fd42be801bab17e40f2b867ad8b4cbc2b9dc990b4adaeca"
    end
  end

  def install
    bin.install "glas"

    bash_completion.install "completions/bash/glas" if File.exist? "completions/bash/glas"
    zsh_completion.install "completions/zsh/_glas" if File.exist? "completions/zsh/_glas"
    fish_completion.install "completions/fish/glas" if File.exist? "completions/fish/glas"
  end

  test do
    assert_match "glas", shell_output("#{bin}/glas --version")
  end
end
