class Reserve < ApplicationRecord

    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :guest, presence: true

    validate :After_today
    validate :After_the_start_date

    def After_today
        errors.add(:start_day, "開始日は今日以降のものを選択して下さい") unless
        start_day.nil? || Date.today <= self.start_day
    end

    def After_the_start_date
        errors.add(:enddate, "終了日は開始日以降のものを選択してください") unless
        end_day.nil? || self.start_day <= self.end_day
    end



    belongs_to :user
    belongs_to :register

    def amount_day
        total_days = (self.end_day - self.start_day).to_i
    end
    def amount_price
        total_price = self.fee.to_i * self.guest.to_i * amount_day.to_i
    end
end
