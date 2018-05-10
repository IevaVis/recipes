require 'rails_helper'

RSpec.describe Cocktail, type: :model do 

	context "validations" do
    it "should have title, ingredients and preparation and user_id" do
      should have_db_column(:title).of_type(:string)
      should have_db_column(:ingredients).of_type(:text)
      should have_db_column(:preparation).of_type(:text)
      should have_db_column(:user_id).of_type(:integer)
    end

   describe "validates presence of attributes" do
     it { is_expected.to validate_presence_of(:title) }
     it { is_expected.to validate_presence_of(:ingredients) }
     it { is_expected.to validate_presence_of(:preparation) }
    end
  end

   context "associations" do
    it { is_expected.to belong_to(:user) }
  end
end

