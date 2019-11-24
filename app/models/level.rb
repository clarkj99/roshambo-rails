class Level < ApplicationRecord
    belongs_to :player
    belongs_to :battlefield
end
