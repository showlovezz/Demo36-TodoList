class TodoitemsController < ApplicationController

  def create
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = @todolist.todoitems.build(todoitem_params)
    @todoitem.save!
    redirect_to todolist_path(@todolist)
  end

  def destroy
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = Todoitem.find(params[:id])

    @todoitem.destroy
    redirect_to todolist_path(@todolist)
  end

  def complete
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = Todoitem.find(params[:id])
    @todoitem.update_attribute(:done, true)
    flash[:notice] = "Todo Item Completed"
    redirect_to todolist_path(@todolist)
  end

  private

  def todoitem_params
    params.require(:todoitem).permit(:content)
  end

end
