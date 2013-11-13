# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :major, :class => 'Major' do
    name "MyString"
    code "MyString"
    college_type "MyString"
    parent_id 1
  end
end
