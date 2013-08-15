class MusiciansController < ApplicationController
  def show
    @musician = musician
  end

  private

  def musician
    Musician.find params[:id]
  end
end
