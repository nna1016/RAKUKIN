class Attendance < ApplicationRecord
    belongs_to :user, optional: true
end
