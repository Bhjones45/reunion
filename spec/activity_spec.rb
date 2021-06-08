require 'rspec'
require './lib/activity'

RSpec.describe Activity do
  describe 'instantitaion' do
    it 'exists' do
      activity = Activity.new("Brunch")
      expect(activity).to be_a(Activity)
    end

    it 'has attributes' do
      activity = Activity.new("Brunch")

      expect(activity.name).to eq("Brunch")
      expect(activity.participants).to eq({})
    end
  end

  describe 'methods' do
    before :each do
      @activity = Activity.new("Brunch")
    end

    it "can add participants" do
      @activity.add_participant("Maria", 20)

      expect(@activity.participants).to eq({"Maria" => 20})
      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      expect(@activity.total_cost).to eq(60)
    end

    it "can split evenly amongst all" do
      @activity = Activity.new("Brunch")
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end
