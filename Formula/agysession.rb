class Agysession < Formula
  version '0.1.1'
  homepage 'https://github.com/hagatasdelus/agysession'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/hagatasdelus/agysession/releases/download/v0.1.1/agysession_v0.1.1_darwin_arm64.zip'
      sha256 '0f1cb0a49f1bceabf0f6a32049fcfc4de0cd9bcfc5d78e77d609ab66324d57dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/hagatasdelus/agysession/releases/download/v0.1.1/agysession_v0.1.1_darwin_amd64.zip'
      sha256 'a95d4c069782748b5370ebc200a3c19b00f69b53f2c4076f10f688537b936a44'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/hagatasdelus/agysession/releases/download/v0.1.1/agysession_v0.1.1_linux_arm64.tar.gz'
      sha256 'e44d5f1c545da5c7a0eb0b756301357a31347b372a51ab1258fcaa89bffe2bb4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/hagatasdelus/agysession/releases/download/v0.1.1/agysession_v0.1.1_linux_amd64.tar.gz'
      sha256 'a4d43e75fed585d9c5e4e59b52c49f1776cde6c6a22437248c4236f8b64efb82'
    end
  end

  head do
    url 'https://github.com/hagatasdelus/agysession.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'agysession'
  end

  test do
    system "#{bin}/agysession", '-h'
  end
end
