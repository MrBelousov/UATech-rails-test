class Micropost < ActiveRecord::Base
  belongs_to :user

  # 5 microposts per one page
  paginates_per 5

  # Validations
  validates :micropost_text, length: { maximum: 120 }, allow_blank: false
end
