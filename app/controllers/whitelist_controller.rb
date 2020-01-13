# frozen_string_literal: true

class WhitelistController < ApplicationController
  def index; end

  def search
    @whitelist = WhitelistService.new.available_postcode(postcode)
    render 'index'
  end

  private

  def postcode
    params.require(:postcode)
  end
end
