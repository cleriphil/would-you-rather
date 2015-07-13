require 'rails_helper'

describe Question do
  it { should validate_presence_of :description_a }
  it { should validate_presence_of :description_b }
  it { should validate_presence_of :image_a }
  it { should validate_presence_of :image_b }
end
