class RentSerializer  < ActiveModel::Serializer
  attributes :id, :user, :book, :init_date, :end_date
end