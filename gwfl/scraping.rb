require 'mechanize'


agent = Mechanize.new
page = agent.get('https://kishojin.weathermap.jp/diary.php?ym=202005&ame=46106')
# page.search('.tdiary img').each do |ele|
#   puts ele
# end

elements = page.search('.tdiary img')
# puts elements

elements.each do |ele|
  puts ele.get_attribute('alt')
end