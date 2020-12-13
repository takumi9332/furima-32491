FactoryBot.define do
  factory :purchaser_form do
    postal_code   {"123-4567"}
    prefecture_id {2}
    city          {"札幌市"}
    address       {"札幌1-1-1"}
    building      {"札幌ビル"}
    phone_number  {"09012345678"}
    user_id       {1}
    product_id    {1}
    purchase_id   {1}
  end
end
