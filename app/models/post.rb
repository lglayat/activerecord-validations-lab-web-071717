class Post < ActiveRecord::Base
 # title, content, summary, category

 validates :title, presence: true
 validates :content, length: { minimum: 250 }
 validates :summary, length: { maximum: 250 }
 validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


 validate :is_clickbait?

 @@clickbait= ["Won't Believe", "Secret" ,"Top" ,"Guess"]

 def is_clickbait?
  is_bait = false

   if self.title
     @@clickbait.each do |bait|
       if self.title.include?(bait)
         is_bait = true
       end
     end
  end

  if is_bait != true
    self.errors[:title] << "Not clickbait"
  end
end





end
