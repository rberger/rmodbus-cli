require "rmodbus"

module RmodbusCli
  class Modbus
    def read_value(opts)
      cl = RTUClient.new(opts[:tty], opts[:baudrate])
      cl.with_slave(opts[:slave_id]) do |slave|
        puts slave.read_holding_registers[opts[:address]]
      end
    end
  end
end

