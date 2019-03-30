require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should have_many(:grades) }
  it { should have_many(:courses).through(:grades)}
end
