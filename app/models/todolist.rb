class Todolist < ApplicationRecord

  has_many :todoitems
  validates :title, :description, presence: true

end