class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :permissions, :user_id
end
