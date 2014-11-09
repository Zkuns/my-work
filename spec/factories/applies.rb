# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apply do
    realname "MyString"
    mobile "MyString"
    email "MyString"
    company "MyString"
    position "MyString"
    status 1
    checkin false
    qrcode "MyString"
  end
end
