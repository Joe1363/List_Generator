class Element < ActiveRecord::Base
  belongs_to :list
  has_many :list_items
end
