require 'json'

class FooController < ApplicationController
  def index
    # j = {}
    # 100.times{|y|
    #   a = []
    #   98.times{a << [true,false].sample}
    #   j[y] = a
    # }
    # render json: j.to_json
    ys = Cell.pluck(:y).uniq
    j = {}
    ys.each do |y|
      j[y] = Cell
        .group(:x)
        .where(y: y)
        .select(:x, :walkable)
    end
    render json: j.to_json
  end
end
