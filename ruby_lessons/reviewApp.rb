# メソッドの定義
def post_review(posts)
  #レビューの投稿
  # 変数の定義
  post = {}
  puts "ジャンルを入力して下さい"
  post[:genre] = gets.chomp
  puts "タイトルを入力して下さい"
  post[:title] = gets.chomp
  puts "感想を入力して下さい"
  post[:review] = gets.chomp
  line = "---------------------------"
  
  # レビューの描画
  puts "ジャンル : #{post[:genre]}\n#{line}"
  puts "タイトル : #{post[:title]}\n#{line}"
  puts "感想 : \n#{post[:review]}\n#{line}"
  
  # 配列オブジェクトに追加
  posts << post
  
  # postsをメソッドの呼び出し元に返す
  return posts # なくてもいい。（　<<メソッドの返り値はpostsだから。）
 
end

def read_reviews (posts)
  # リストの表示
  number = 0
  posts.each do |post|
    puts "[#{number}]:#{post[:title]}のレビュー"
    number += 1
  end
  
  # レビューを読む
  puts "見たいレビューの番号を入力してください："
  input = gets.to_i
  
  # レビューの取得
  post = posts[input]
  
  #レビューの描画
  line   = "---------------------------"
  puts "ジャンル : #{post[:genre]}\n#{line}"
  puts "タイトル : #{post[:title]}\n#{line}"
  puts "感想 : \n#{post[:review]}\n#{line}"
  line = "---------------------------"
  
end

def end_program
  # プログラムを終了する
  exit
end

def exception
  # 無効な値の入力を知らせる
  puts "入力された値は無効な値です"
end

posts = []
  
while true do
  # メニューの表示
  puts "レビュー数:#{posts.length}"
  puts "[0]レビューを書く"
  puts "[1]レビューを読む"
  puts "[2]アプリを終了する"
  input = gets.to_i  
  #.to_iを使うと、文字列が全て「０」になるため、「[0]」を選んだことになってしまう。
  # →input =Integer gets　にすると、整数のみをgetsする。（しかし、文字列が入力されるので、エラーになりプログラムは止まる。
  #それを避けるためには、メニューに「０」を使わないことが一番良さそう。（またはif文で場合分け）
  
  if input == 0 then    # 「レビューを書く」
    posts = post_review(posts) # post_review(posts)メソッドが持っているのは、「posts」の中身だけなので、入れたいpostsに代入する。
  
  elsif input == 1 then   #「レビューを読む」
    # レビューを読む
    read_reviews(posts)
  elsif input == 2 then   #「プログラムを終了する」
    #プログラムを終了させる
    end_program
  else
    exception
  end
end