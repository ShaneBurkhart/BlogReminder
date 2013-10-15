# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planned_date do
    planned_date "2013-10-14"
    content "MyString"
    blog_id 1
  end
end
