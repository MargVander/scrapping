require_relative '../lib/townhall_email'

describe "the get_townhall_email" do
	it "countain Ableiges" do
		expect(get_townhall_email(townhall_url).any? {"ABLEIGES" == nil}).to eq(false)
	end
end