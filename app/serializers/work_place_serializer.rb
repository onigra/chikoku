class WorkPlaceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :destination, :hour, :min
end
