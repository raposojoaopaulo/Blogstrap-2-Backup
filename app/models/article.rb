class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :presence => true, :length => {:minimum=>3, :maximum=>50}
  validates :body, :presence => true, :length => {:minimum=>10, :maximum=>4999}

  paginates_per 7

  scope :desc_order, -> { order(created_at: :desc) }
  scope :without_highlights, -> (ids) { where("id NOT IN(#{ids})") if ids.present? }
  scope :filter_category, -> (category) { where category_id: category.id if category.present?}
  scope :filter_archive, lambda { |month_year|
    if month_year
      date = Date.strptime(month_year, "%B %Y")
      where(created_at: date.beginning_of_month..date.end_of_month.end_of_day)
    end
    }
  # Ex:- scope :active, -> {where(:active => true)}
end
