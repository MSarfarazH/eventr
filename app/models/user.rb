class User < ApplicationRecord
    has_many :events_lists
    has_many :events, through: :events_lists
    has_and_belongs_to_many :friends,
      class_name: "User",
      join_table: "friends_lists",
      association_foreign_key: "user_id_2"
    has_and_belongs_to_many :chats,
      class_name: "User",
      join_table: "chat",
      association_foreign_key: "user_id_2"

      validates(:name, :age, :bio, {presence: true})
      validates :bio, length: { in: 1..140 }






 
end
  