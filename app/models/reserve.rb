class Reserve < ApplicationRecord
    belongs_to :user
    belongs_to :register

    def amount_day
        total_days = (self.end_day - self.start_day).to_i
    end
    def amount_price
        total_price = self.fee.to_i * self.guest.to_i * amount_day.to_i
    end
end
