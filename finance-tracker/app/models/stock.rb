class Stock < ApplicationRecord
	def self.new_from_lookup(ticker_symbol)
		begin
			looked_up= StockQuote::Stock.new(api_key:'pk_69c62695f8f94754b2365db2121e4896')
			looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
			new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price:looked_up_stock.latest_price)
		rescue Exception => e
			return nil
		end
	end
end

