class Post < ApplicationRecord
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates :title, presence: true
    validate :is_clickbait

    def is_clickbait
       if title == "You Won't Believe These True Facts"
       else
        click_bait_error
       end
    end

    def click_bait_error
        errors.add(:title, "Not Clicky ENough!!")
    end
end
