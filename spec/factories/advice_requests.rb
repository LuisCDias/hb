# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advice_request do
    comment "MyText"
    category_id 1
    user_track_id 1
    drums false
    bass false
    vocals false
    synths false
    structure false
    effects false
    mixing false
    master false
  end
end
