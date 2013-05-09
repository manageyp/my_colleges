# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    user_id 1
    mac "MyString"
    status "MyString"
  end
end
