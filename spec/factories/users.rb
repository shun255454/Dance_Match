FactoryBot.define do
  factory :user do
    name                  {"abe"}
    email                 {"kkk@gmail.com"}
    img_name              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/5.jpg')) }
    password              {"123456"}
    password_confirmation {"123456"}
    self_introduction     {"aaaaaa"}
  end
end