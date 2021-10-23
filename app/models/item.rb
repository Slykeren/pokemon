class Item < ApplicationRecord

    validates :name, :sprite, presence: true
end
