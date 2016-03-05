class Recipe
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = (raise RuntimeError, ENV['FOOD2FORK_SERVER_AND_PORT']) rescue 'www.food2fork.com'

	base_uri "http://#{hostport}/api"
	default_params key: "aeed8c1d2d2ea1d2fc291517bce5f03c"
	format :json
	
	def self.for term
		get("/search", query: {q: term}) ["recipes"]
	end

end