require 'hidapi'

module Niz
  class Keyboard
    def initialize
      puts 'open'
      @device = HIDAPI::open(VENDOR_ID, PRODUCT_ID)
      @version = version
      p @version
    end

    def close
      @device.close
puts 'closed'
    end

    def send_command(command, data='')
      report_id = 0x00
      buf = String.new("\0" * 65, encoding: 'BINARY')
      buf[0] = report_id.chr
      buf[1, 2] = [command].pack("n")
      buf[3, [62, data.size].min] = data
      p buf
      @device.write(buf)
    end

    def recv_data
      ret = @device.read
      p ret
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
