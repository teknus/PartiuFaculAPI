class Login < ApplicationRecord
    validates :token, presence: true
end
