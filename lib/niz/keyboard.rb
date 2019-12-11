require 'hidapi'

module Niz
  class Keyboard
    def initialize
      @device = HIDAPI.open(VENDOR_ID, PRODUCT_ID)
      @version = version
    end

    def close
      @device.close
    end

    def send_command(command, data='')
      report_id = 0x00
      buf = String.new("\0" * 64, encoding: 'BINARY')
      buf[0, 2] = [command].pack("n")
      buf[2, [62, data.size].min] = data
      @device.write(buf)
    end

    def recv_data
      ret = @device.read
      ret
    end

    def version
      send_command(Niz::COMMAND_VERSION)
      recv_data
    end

    def self.open
      dev = Keyboard.new
      return dev unless block_given?
      yield dev
    ensure
      dev.close if block_given?
    end

  end
end
