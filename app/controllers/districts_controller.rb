# frozen_string_literal: true

class DistrictsController < ApplicationController
  def index
    @districts = District.ordered_by_update_date(page: params[:page])
  end

  def show
    @district = District.find(params[:id])
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)

    if @district.save
      redirect_to @district
    else
      render 'new'
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    @district = District.find(params[:id])

    if @district.update(district_params)
      redirect_to @district
    else
      render 'edit'
    end
  end

  private

  def district_params
    params.require(:district).permit(:district, :name)
  end
end
