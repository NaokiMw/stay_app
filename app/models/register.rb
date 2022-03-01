class Register < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reserves
    belongs_to :user,optional: true
end

