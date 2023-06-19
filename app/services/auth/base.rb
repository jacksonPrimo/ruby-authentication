module Services
	module Auth
		class Base < ApplicationService
			def initialize(params)
				@params = params
			end
		end
	end
end