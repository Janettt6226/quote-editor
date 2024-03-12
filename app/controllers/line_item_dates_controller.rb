class LineItemDatesController < ApplicationController
  before_action :set_quote, only: %i[new create]
  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    if @line_item_date.save!
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Date was correctly added to the quote"}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
