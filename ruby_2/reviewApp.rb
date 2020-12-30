def post_review
  post = {}
  puts "ジャンルを入力してください："
  # post[:genru] = gets.chomp
  post = {genru: gets.chomp}
  puts "タイトルを入力してください："
  post[:title] = gets.chomp
  puts "感想を入力してください："
  post[:review] = gets.chomp
  line = "------------"
  
  puts "ジャンル : #{post[:genru]}\n#{line}"
  puts "タイトル : #{post[:title]}\n#{line}"
  puts "感想 : \n#{post[:review]}\n#{line}"
  
  return post
  # posts << post
  
end

def read_reviews(posts)
  number = 0
  posts.each do |post|
    puts "[#{number}]:#{post[:title]}のレビュー"
    number += 1
  end
  loop do
    puts "\n見たいレビューの番号を入力してください："
    input = gets.to_i
    if input <= posts.length
      line = "------------"
      puts "ジャンル : #{posts[input][:genru]}\n#{line}"
      puts "タイトル : #{posts[input][:title]}\n#{line}"
      puts "感想 : \n#{posts[input][:review]}\n#{line}"
      break
    else
      puts "そのレビューはありません"
    end
  end
end

def end_program
  exit
end

def exception
  puts "入力は無効です"
end

posts = []

while true do
  puts"レビュー数:#{posts.length}\n[1]レビューを書く\n[2]レビューを読む\n[3]アプリを終了する"
  input = gets.to_i
  
  if input == 1
    posts << post_review
  
  elsif input == 2
    if posts.length <=0 
      puts "まだレビューが投稿されていません"
    else
      read_reviews(posts)
    end
    
  elsif input == 3
    end_program
  
  else
    exception
    
  end
end