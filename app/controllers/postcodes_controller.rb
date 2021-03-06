# frozen_string_literal: true

class PostcodesController < ApplicationController
  def index
    @postcodes = Postcode.ordered_by_update_date(page: params[:page])
  end

  def new
    @postcode = Postcode.new
  end

  def create
    @postcode = Postcode.new(postcode_params)

    if @postcode.save
      redirect_to action: 'index'
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
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    Postcode.find(params[:id])&.destroy
    redirect_to action: 'index'
  end

  private

  def postcode_params
    params.require(:postcode).permit(:postcode, :value)
  end
end
