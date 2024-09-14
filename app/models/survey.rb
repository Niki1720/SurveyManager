class Survey < ApplicationRecord
  before_save :capitalize_names

  validates :first_name, :last_name, :gender, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 50, less_than_or_equal_to: 250 }

  private

  def capitalize_names
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
