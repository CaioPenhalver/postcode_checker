# frozen_string_literal: true

class WhitelistController < ApplicationController
  def index; end

  def search
    if Postcode.valid_format?(params[:postcode])
      @whitelist = WhitelistService.new.available_postcode(params[:postcode])
    else
      send_error_message
    end
    render 'index'
  end

  private

  def send_error_message
    postcode = params[:postcode].present? ? params[:postcode] : 'It'
    flash[:error] = "#{postcode} is not a valid format for a postcode!"
  end
end
