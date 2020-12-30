results = [
  {name: "田中", kokugo: 85, sugaku: 62, eigo: 77},
  {name: "佐藤", kokugo: 90, sugaku: 40, eigo: 98},
  {name: "ボブ", kokugo: 2, sugaku: 50, eigo: 100},
  ]



# sum = 0

# puts results
# puts "解答者:#{results[0]}"

line = "-----------------"
puts line

results.each do |result|

#→？？ハッシュの中身（kokugo,sugaku...も繰り返しで書くことができる。その方法とは？
  puts "解答者:#{result[:name]}さん"
  puts "国語:#{result[:kokugo]}点"
  puts "数学:#{result[:sugaku]}点"
  puts "英語:#{result[:eigo]}点"
  # sum = result[:kokugo] + result[:sugaku] + result[:eigo]
  puts "合計:#{result[:kokugo] + result[:sugaku] + result[:eigo]}点"
  puts line
end