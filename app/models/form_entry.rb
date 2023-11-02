class FormEntry
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email, :string
end