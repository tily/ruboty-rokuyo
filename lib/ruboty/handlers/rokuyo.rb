# coding:utf-8
require 'qreki'
require 'time'
require 'json'

module Ruboty
  module Handlers
    class Rokuyo < Base
      def initialize(robot)
        super(robot)
        @config = JSON.parse File.read(File.dirname(__FILE__) + '/rokuyo.json', encoding: Encoding::UTF_8)
      end

      on(
        /rokuyo( (?<date>.+))?/,
        name: 'rokuyo',
        description: 'output rokuyo'
      )

      on(
        /(?:taian|大安)( (?<date>.+))?/,
        name: 'taian',
        description: 'output most recent 大安 date'
      )


      def rokuyo(message)
        time = message[:date] ? Time.parse(message[:date]) : Time.now
        rokuyo = time2rokuyo(time)
        message.reply [
          "☆#{time.strftime('%Y/%m/%d')}の六曜\☆\n\n",
          "  ====\n  #{rokuyo}\n  ====\n",
          description(rokuyo).gsub(/^/, "  ")
        ].join
      end

      def taian(message)
        time   = message[:date] ? Time.parse(message[:date]) : Time.now
        rokuyo = time2rokuyo(time)
        until rokuyo == '大安' do
          time += 24 * 60 * 60
          rokuyo = time2rokuyo(time)
        end
        message.reply "★直近の大安★ \n #{time.strftime('%Y/%m/%d')}"
      end

      def description(name)
        rokuyo = @config.find{|rokuyo| rokuyo['rokuyo'] == name }
        rokuyo['description']
      end

      def time2rokuyo(time)
        Qreki.calc(time.year, time.month, time.day).rokuyou
      end
    end
  end
end
