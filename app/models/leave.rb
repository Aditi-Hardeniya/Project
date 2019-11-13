class Leave < ApplicationRecord
    belongs_to :user
    POSITION_TYPES=["Full Day" ,"Half Day","On Tour"]
end