# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school_photo do
    school_id 1
    photo_url "MyString"
    is_avatar false
    status "MyString"
  end
end
