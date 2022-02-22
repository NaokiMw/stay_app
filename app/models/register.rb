class Register < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to:reserves
    belongs_to:users,,class_name: 'user',foreign_key: 'user_id'
end

