class Ingredient < ApplicationRecord
  before_destroy :check_for_cocktails
  has_many :doses

  validates :name, presence: true, uniqueness: true

  private

  def check_for_cocktails
    Dose.where(ingredient: self).size < 1
  end
end
