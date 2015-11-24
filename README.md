# Ruboty::Rokuyo

## Install

```ruby
# Gemfile
gem 'ruboty-rokuyo'
```

## Usage

```
ruboty /(?:taian|大安)( (?<date>.+))?/ - output most recent 大安 date
ruboty /rokuyo( (?<date>.+))?/         - output rokuyo

```

Examples:

```
> @ruboty rokuyo
☆2015/11/24の六曜☆

  ====
  仏滅
  ====
  「仏も滅するような大凶日」の意味。元は「空亡」「虚亡」と言っていたが、これを全てが虚しいと解釈して「物滅」と呼ぶようになり、これに近年になって「佛（仏）」の字が当てられたものである。
  この日は六曜の中で最も凶の日とされ、婚礼などの祝儀を忌む習慣がある。この日に結婚式を挙げる人は少ない。そのため仏滅には料金の割引を行う結婚式場もある。他の六曜は読みが複数あるが、仏滅
は「ぶつめつ」としか読まれない。
  字面から仏陀（釈迦）が入滅した（亡くなった）日と解釈されることが多いが、上述のように本来は無関係である。釈迦の死んだ日とされる2月15日が旧暦では必ず仏滅になるのは、偶然そうなっただけである。
  「何事も遠慮する日、病めば長引く、仏事はよろしい」ともいわれる。
  また『物滅』として「物が一旦滅び、新たに物事が始まる」とされ、「大安」よりも物事を始めるには良い日との解釈もある。
  出典：http://ja.wikipedia.org/wiki/%E5%85%AD%E6%9B%9C
> @ruboty rokuyo 2015/12/25
☆2015/12/25の六曜☆

  ====
  先勝
  ====
  「先んずれば即ち勝つ」の意味。かつては「速喜」「即吉」とも書かれた。万事に急ぐことが良いとされる。
  「午前中は吉、午後二時より六時までは凶」と言われる。
  「せんしょう」「せんかち」「さきがち」「さきかち」などと読まれる。
  出典：http://ja.wikipedia.org/wiki/%E5%85%AD%E6%9B%9C
> @ruboty taian
★直近の大安★ 
 2015/11/25
> @ruboty taian 2015/11/26
★直近の大安★ 
 2015/12/01
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruboty-niftycloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

