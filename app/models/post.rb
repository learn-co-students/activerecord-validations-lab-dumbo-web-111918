class Post < ActiveRecord::Base
	validates :title, presence: true, format: { with: /You Won't Believe*/ }
	validates :content, length: { minimum: 10 }
	validates :summary, length: { maximum: 20 }
	validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
end
