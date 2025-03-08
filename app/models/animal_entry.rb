class AnimalEntry < ApplicationRecord
  # バリデーション
  validates :name, presence: true, uniqueness: true
  validates :scientific_name, presence: true
  validates :habitat, presence: true
  validates :characteristics, presence: true
end
