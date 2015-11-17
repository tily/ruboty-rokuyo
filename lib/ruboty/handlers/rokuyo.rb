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
        message.reply "☆今日の六曜\☆\n\n"
        message.reply "  ===="
        message.reply "  #{rokuyo}"
        message.reply "  ===="
        message.reply description(rokuyo).gsub(/^/, "  ")
      end

      def description(name)
        rokuyo = @config.find{|rokuyo| rokuyo['rokuyo'] == name }
        rokuyo['description']
      end
    end
  end
end
