class Todoitem < ApplicationRecord

  belongs_to :todolist
  validates :content, presence: true
  def done?
    done
  end

end
