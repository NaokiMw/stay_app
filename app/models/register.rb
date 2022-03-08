class Register < ApplicationRecord
    validates :name_room, presence: true

    validates :int_room, length: {maximum:300}

    validates :price, numericality: true, presence: true

    validates :adress, presence: true

    mount_uploader :image, ImageUploader
    has_many :reserves
    belongs_to :user,optional: true
end

