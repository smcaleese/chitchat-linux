class Page < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 1 }
    validates :description, presence: true, length: { minimum: 1 }
end
