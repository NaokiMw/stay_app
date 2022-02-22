class Register < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reserve
    belongs_to :user,optional: true
end

