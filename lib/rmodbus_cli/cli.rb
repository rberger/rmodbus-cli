require "slop"

module RmodbusCli
  class Cli

    def doit
      opts = Slop.parse do |o|
        o.string '-t', '--tty', 'Serial (USB) Port', default: '/dev/tty.usbserial-DB00KZ46'
        o.integer '-b', 'baudrate', 'Serial port baudrate', default: 115200
        o.integer '-s', 'slave_id', "Modbus slave ID", default: 1
        o.integer '-a', 'address', "Slave Register Address", default: 312
        o.on '--version', 'print the version' do
          puts Slop::VERSION
          exit
        end
        o.on '--help' do
          puts o
          exit
        end
      end

      puts opts.to_hash
      modbus = RmodbusCli::Modbus.new
      modbus.read_value(opts)
    end
  end
end
