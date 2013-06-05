FactoryGirl.define do
  factory :user do
    name     "Alfred Nutile"
    email    "alfrednutile@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end