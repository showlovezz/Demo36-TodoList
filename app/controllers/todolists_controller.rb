class TodolistsController < ApplicationController

  before_action :find_todolist, only: [:show, :edit, :update, :destroy]

  def index
    @todolists = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      flash[:notice] = "待辦事項新增成功"
      redirect_to todolists_path
    else
      flash[:alert] = "待辦事項新增失敗"
      render "new"
    end
  end

  def show
    @todoitem = Todoitem.new
  end

  def edit
  end

  def update
    if @todolist.update(todolist_params)
      flash[:notice] = "待辦事項修改成功"
      redirect_to todolists_path
    else
      flash[:alert] = "待辦事項修改失敗"
      render "edit"
    end
  end

  def destroy
    @todolist.destroy
    flash[:alert] = "Todolist 被刪除"
    redirect_to todolists_path
  end

  private

  def todolist_params
    params.require(:todolist).permit(:title, :description)
  end

  def find_todolist
    @todolist = Todolist.find(params[:id])
  end

end
