require('spec_helper')

describe(Tag) do
  it { should have_many(:recipes) }
  it { should have_many(:ingredients) }
end
