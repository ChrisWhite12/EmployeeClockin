class Card < ApplicationRecord
    belongs_to :employee
    has_many :report, dependent: :destroy
end
