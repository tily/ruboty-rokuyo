# coding:utf-8
require 'qreki'
require 'time'
require 'json'

module Ruboty
  module Handlers
    class Rokuyo < Base
      def initialize(robot)
        super(robot)
        @config = JSON.parse File.read(File.dirname(__FILE__) + '/rokuyo.json')
      end

      on(
        /rokuyo( (?<date>.+))?/,
        name: 'rokuyo',
        description: 'output rokuyo'
      )

      def rokuyo(message)
        time = message[:date] ? Time.parse(message[:date]) : Time.now
        rokuyo = Qreki.calc(time.year, time.month, time.day).rokuyou
        message.reply [
          "☆#{time.strftime('%Y/%m/%d')}の六曜\☆\n\n",
          "  ====\n  #{rokuyo}\n  ====\n",
          description(rokuyo).gsub(/^/, "  ")
        ].join
      end

      def description(name)
        rokuyo = @config.find{|rokuyo| rokuyo['rokuyo'] == name }
        rokuyo['description']
      end
    end
  end
end
