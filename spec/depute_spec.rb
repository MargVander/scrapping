require_relative '../lib/depute'


describe "the first_name method" do
	it "contain Sabine" do
		expect(first_name.include? "Sabine").to eq(true)
	end
end

describe "the last_name method" do
	it "countain Abba" do
		expect(last_name.include? "Abba").to eq(true)
	end
end


