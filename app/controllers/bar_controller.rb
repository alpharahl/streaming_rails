require 'json'

class BarController < ApplicationController
  def create
    cells = params[:blob]
    cells.each do |y, x_array|
      x_array.each_with_index do |x, indx|
        cell = Cell.where(x: indx, y: y).first
        if cell
          cell.update_attributes({walkable: x})
        else
          BarHelper.createCell({
            x: indx,
            y: y,
            walkable: x
          })
        end
      end
    end
    render json: cells
  end
end
