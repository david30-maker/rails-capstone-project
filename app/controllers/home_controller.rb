class HomeController < ApplicationController

    def index; end

    # def index
    #     @expense = Expense.new
    #     @expenses = Expense.all
    # end
    
    # def create
    #     @expense = Expense.new(expense_params)
    #     if @expense.save
    #     redirect_to root_path, notice: "Expense added successfully"
    #     else
    #     render :index
    #     end
    # end
    
    # private
    
    # def expense_params
    #     params.require(:expense).permit(:title, :amount, :date)
    # end
end
