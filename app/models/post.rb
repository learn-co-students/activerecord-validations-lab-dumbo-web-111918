# class MyValidtor < ActiveModel::EachValidator
#
#   def validate_each(post, attribute, value)
#     unless value.include ("Won't Believe"|| "Secret" || "Top [number]" || "Guess")
#       record.errors[attribute] << (options[:message] || "is not Click-Bait")
#     end
#   end
# end

class MyValidator < ActiveModel::Validator
  def validate(post)
  #  byebug
    unless !post.title.nil? && (post.title.include? ("Won't Believe"|| "Secret" || "Top [number]" || "Guess"))
       post.errors[:title] << (options[:message] || "is not Click-Bait")
     end
   end
 end


class Post < ActiveRecord::Base
  validates :title,  presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "%{value} is not a valid category"}
  include ActiveModel::Validations
   validates_with MyValidator


end
