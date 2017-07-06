class Post < ActiveRecord::Base

  def self.parse

    #@lists = []

    1.upto(5) do |i|

      doc = Nokogiri::HTML(open("http://sunbrisbane.com/libr/libr.php?id=job&page=#{i}&select_arrange=headnum&desc=asc&category=&sn=off&ss=on&sc=on&keyword=&sn1=&divpage=1"))
      doc.encoding = 'utf-8'

      lists = doc.css('.list_han')
      lists.css('img', 'b', 'font').remove

      lists.each do |list|

        if list.content.strip != ''

          post = new
          post.title = list.inner_text
          post.save
          #@lists.push(list.inner_text)
        end
      end

    end
  end

end
