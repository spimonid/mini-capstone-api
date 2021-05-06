class BodyParamsController < ApplicationController
  def send_secret
    input_value = params["secret_info"]
    render json: { message: "The secret info is #{input_value}" }
  end
end
