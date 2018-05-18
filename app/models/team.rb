class Team < ApplicationRecord
  belongs_to :organization
  has_many :teaminvites, :dependent => :destroy
  validates :team_name, presence: true
end
