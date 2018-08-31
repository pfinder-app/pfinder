require "rails_helper"

RSpec.describe "Hello World request", :type => :request do

  it "is successful" do
    get "/"
    expect(response.success?).to be(true)
  end
end
