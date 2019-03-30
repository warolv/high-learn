require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:grades) }
  it { should belong_to(:teacher) }
  it { should have_many(:students).through(:grades)}
end
