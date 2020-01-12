# frozen_string_literal: true

class PostcodesController < ApplicationController
  def show
    @postcode = Postcode.find(params[:id])
  end

  def new
    @postcode = Postcode.new
  end

  def create
    @postcode = Postcode.new(postcode_params)

    if @postcode.save
      redirect_to @postcode
    else
      render 'new'
    end
  end

  def edit
    @postcode = Postcode.find(params[:id])
  end

  def update
    @postcode = Postcode.find(params[:id])

    if @postcode.update(postcode_params)
      redirect_to @postcode
    else
      render 'edit'
    end
  end

  private

  def postcode_params
    params.require(:postcode).permit(:postcode, :value)
  end
end
