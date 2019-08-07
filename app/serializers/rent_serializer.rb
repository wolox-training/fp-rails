class RentSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :book, serializer: BookSerializer
  belongs_to :user

  def from
    object.start_date
  end

  def to
    object.end_date
  end
end
