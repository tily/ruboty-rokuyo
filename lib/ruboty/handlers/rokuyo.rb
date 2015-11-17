require 'qreki'
require 'time'

module Ruboty
  module Handlers
    class Rokuyo < Base
      on(
        /rokuyo( (?<date>.+))?/,
        name: 'rokuyo',
        description: 'output rokuyo'
      )

      def rokuyo(message)
        time = message[:date] ? Time.parse(message[:date]) : Time.now
        rokuyo = Qreki.calc(time.year, time.month, time.day).rokuyou
        message.reply rokuyo
      end
    end
  end
end
