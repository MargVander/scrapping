require_relative '../lib/crypto_scrapper'

describe "the crypto_scrapper method" do
	it "countain the BitCoin symbol" do
		expect(crypto_scrapper.any? {"BTC" == nil}).to eq(false)
	end
end