class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :presence => true, :length => {:minimum=>3, :maximum=>50}
  validates :body, :presence => true, :length => {:minimum=>10, :maximum=>3999}

  paginates_per 4

  scope :desc_order, -> { order(created_at: :desc) }
  scope :without_highlights, -> (ids) { where("id NOT IN(#{ids})") if ids.present? }
  scope :filter_category, -> (category) { where category_id: category.id if category.present?}
  # Ex:- scope :active, -> {where(:active => true)}
end
