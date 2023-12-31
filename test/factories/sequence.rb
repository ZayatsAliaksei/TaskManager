FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description] do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :avatar do |n|
    "avatar#{n}#{SecureRandom.base64(8)}.com"
  end
  sequence :expired_at do |n|
    Date.today + n
  end
end
