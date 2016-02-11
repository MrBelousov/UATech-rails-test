class Micropost < ActiveRecord::Base
  belongs_to :user

  # 10 microposts per one page
  self.per_page = 10

  # Validations
  validates :micropost_text, length: { maximum: 120 }, allow_blank: false
end
