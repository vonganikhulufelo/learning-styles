class Organization < ApplicationRecord
  belongs_to :user
  has_many :teams, :dependent => :destroy
  validates :org_name, presence: true
end
