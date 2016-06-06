module Clickatellsend
	class Request

	  def initialize()
	    @url = CLICKATELL_URL
		  @user = CLICKATELL_USER
		  @password = CLICKATELL_PASSWORD
		  @api_id = CLICKATELL_API_ID
	  end

	  # :to, :text, :deliv_time
	  def send_msg(params)
			response(RestClient.get "#{@url}http/sendmsg", {:params => options(params)})
	  end

	  def get_balance
	  	response(RestClient.get "#{@url}http/getbalance", {:params => options({})})
	  end

	  # :apimsgid
	  def get_msg_charge(params)
	  	response(RestClient.get "#{@url}http/getmsgcharge", {:params => options(params)})
	  end

	  # :msisdn
	  def route_coverage(params)
	  	response(RestClient.get "#{@url}utils/routecoverage", {:params => options(params)})
	  end

	  # :apimsgid
	  def get_msg_status(params)
	  	response(RestClient.get "#{@url}http/querymsg", {:params => options(params)})
	  end

	  # :apimsgid
	  def stop_msg(params)
	  	response(RestClient.get "#{@url}http/delmsg", {:params => options(params)})
	  end

	  def auth
	  	response(RestClient.get "#{@url}http/auth", {:params => options({})})
	  end

	  # :session_id
	  def prevent_expiring(params)
	  	response(RestClient.get "#{@url}http/ping", {:params => params})
	  end

	  private

	  	def options(params)
	  		if params[:session_id]
	  			params.merge({:api_id => @api_id})
	  		else
	  			params.merge({:user => @user, :password => @password, :api_id => @api_id})
	  		end
	  	end

	  	def response(request)
	  		if request.code == 200
		  			response = request.split("\n").map{|l| l.scan /(\w+):\s($|[\w, \d.]+)(?:\s|$)/}.map &:to_h
		  			if response.size == 1
		  				response[0]
		  			end
		  	else
		  		{:ERR => "Could not connect to the API, double check your settings and internet connection"}
		  	end
	  	end

	end
end