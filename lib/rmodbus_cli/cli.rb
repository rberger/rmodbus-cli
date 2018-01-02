require "slop"

module RmodbusCli
  class Cli

    def doit
      opts = Slop.parse do |o|
        o.string '-t', '--tty', 'Serial (USB) Port', default: '/dev/ttyUSB0'
        o.integer '-b', 'baudrate', 'Serial port baudrate', default: 115200
        o.integer '-s', 'slave_id', "Modbus slave ID", default: 1
        o.integer '-a', 'address', "Slave Register Starting Address", default: 312
        o.integer '-c', 'count', "Number of Slave Register Addresses", default: 1
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
