# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    code "MyString"
    nick_name "MyString"
    real_name "MyString"
    country 1
    province 1
    city 1
  end
end
