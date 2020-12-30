def drink(age)
  if age >= 20
    puts "生中で！！"
  else
    puts "ウーロン茶で！！"
  end
end

loop do
  puts "年齢は？" 
  age = gets.to_i
  if age == 0
    puts "１以上の整数を入力してください。"
  else
    drink(age)
    break
  end
end