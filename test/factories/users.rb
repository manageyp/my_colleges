# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "MyString"
    email "MyString"
    email_status "MyString"
    cellphone "MyString"
    cellphone_status "MyString"
    register_date "2013-05-08"
    status "MyString"
  end
end
