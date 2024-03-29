class User < ApplicationRecord
  has_secure_password
  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

    has_many :events_lists, dependent: :destroy
    has_many :events, through: :events_lists
    has_and_belongs_to_many :friends, dependent: :destroy,
      class_name: "User",
      join_table: "friends_lists",
      association_foreign_key: "user_id_2"


    validates(:first_name, :last_name, :age, :bio, :username, :password, {presence: true})
    validates :bio, length: { in: 1..140 }
    validates :username, uniqueness: true


    def last_initial
      array = self.last_name
      array.split
      x = array[0]
      x.capitalize
    end

    def first_last_i
      self.first_name + " "+ self.last_initial+ "."
    end



 
end
  