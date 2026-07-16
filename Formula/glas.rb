VERSION="0.1.1"

class Glas < Formula
  desc "Git-aware ls command written in Rust"
  option "without-completions", "Disable bash completions"
  depends_on "bash-completion@2" => :optional
  homepage "https://github.com/hagatasdelus/glas"
  version VERSION
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hagatasdelus/glas/releases/download/v#{VERSION}/glas-#{VERSION}_amd64_darwin.tar.gz"
    sha256 "a81d6c7eeecc1bed1b87b5f0742ea7e247033af595dacb3ace0a73cfe88512ec"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hagatasdelus/glas/releases/download/v#{VERSION}/glas-#{VERSION}_arm64_darwin.tar.gz"
    sha256 "2bdef7395e67ce4d1cd8b21b07f5fc7dea91432d00a0955ed1e440175c76a451"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hagatasdelus/glas/releases/download/v#{VERSION}/glas-#{VERSION}_amd64_linux.tar.gz"
    sha256 "91317dd9ffa44ac4a00aa8dd4a9f1f06d40a4d8fd174991d3eb37b440361bc3f"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/hagatasdelus/glas/releases/download/v#{VERSION}/glas-#{VERSION}_arm64_linux.tar.gz"
    sha256 "ba0741765ef316db8297398d2f106269acb30c5708eb3c7924e117c3c018d806"
  end

  def install
    bin.install "glas"

    bash_completion.install "completions/bash/glas" if build.with? "completions"
    zsh_completion.install "completions/zsh/_glas" if build.with? "completions"
    fish_completion.install "completions/fish/glas" if build.with? "completions"
  end
end
