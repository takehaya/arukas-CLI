ARUKAS_VERSION='0.1.2'

class Arukas < Formula
  desc "Arukas CLI tool"
  homepage "https://arukas.io"
  url "https://github.com/arukasio/cli/archive/v#{ARUKAS_VERSION}.tar.gz"
  sha256 "88b60f7ad8278d1c6784c111a5edfdcae62d24d71917043c786f5de33683c3f4"

  version ARUKAS_VERSION
  head 'https://github.com/arukasio/cli.git', :branch => 'master'

  depends_on 'go' => :build

  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/alecthomas/template'
    system 'go', 'get', 'github.com/alecthomas/template/parse'
    system 'go', 'get', 'github.com/alecthomas/units'
    system 'go', 'get', 'github.com/joho/godotenv'
    system 'go', 'get', 'github.com/gedex/inflector'
    system 'go', 'get', 'github.com/manyminds/api2go/jsonapi'
    system 'go', 'get', 'gopkg.in/alecthomas/kingpin.v2'

    system 'go', 'build', '-o', 'arukas'
    bin.install 'arukas'
  end

  test do
    system "false"
  end
end