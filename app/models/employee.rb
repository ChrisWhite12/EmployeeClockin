class Employee < ApplicationRecord
    has_one :card, dependent: :destroy
end
