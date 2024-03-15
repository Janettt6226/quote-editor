class LineItemDatesController < ApplicationController
  before_action :set_quote, only: %i[new create edit update destroy]
  before_action :set_line_item_date, only: %i[edit update destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Date was correctly added to the quote"}
        format.turbo_stream { flash.now[:notice] = "Date was successfully created."}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Date successfully updated" }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    if @line_item_date.destroy
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Date was successfully deleted" }
        format.turbo_stream { flash.now[:notice] = "Date was successfully deleted" }
      end
    end
  end


  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end
end
