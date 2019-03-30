require 'rails_helper'

RSpec.describe User, type: :model do
  [:first_name, :last_name, :email].each do |field|
    it { should validate_presence_of(field) }
  end
  
  it { should validate_uniqueness_of(:email) }
end
