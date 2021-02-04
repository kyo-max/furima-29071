class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_bearer
  belongs_to :shipping_area
  belongs_to :ship_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_bearer_id
    validates :shipping_area_id
    validates :ship_day_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ },
              numericality: {
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999
              }
  end

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
