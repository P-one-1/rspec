require 'rails_helper'

RSpec.describe User, :type => :model do
    subject { User.new }
    it "is valid with valid attributes" do
        subject.name = "Anonymous"
        expect(subject).to be_valid
    end
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
end