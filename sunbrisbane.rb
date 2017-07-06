require 'nokogiri'
require 'open-uri'

1.upto(5) do |i|

  doc = Nokogiri::HTML(open("http://sunbrisbane.com/libr/libr.php?id=job&page=#{i}&select_arrange=headnum&desc=asc&category=&sn=off&ss=on&sc=on&keyword=&sn1=&divpage=1"))
  doc.encoding = 'utf-8'

  lists = doc.css('.list_han')
  lists.css('img', 'b', 'font').remove

  lists.each do |list|

    if list.content.strip != ''

      text = list.inner_text
      puts text
      #puts text if text.include?('스시')
    end
  end

end
