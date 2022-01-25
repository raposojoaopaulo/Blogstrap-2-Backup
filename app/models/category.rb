class Category < ApplicationRecord
  has_many :articles, dependent: :restrict_with_error

  validates :name, :presence => true, :length => {:minimum=>3, :maximum=>50}

  scope :sorted, -> { order(:name) }
end
