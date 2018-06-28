require 'json'

class FooController < ApplicationController
  def index
    render json: Datum.first.blob
  end
end
