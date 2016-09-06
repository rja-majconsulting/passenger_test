class SportsTrainingActivity < ActiveRecord::Base
  belongs_to :sports_training
  belongs_to :activity
end
