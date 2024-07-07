module Admin
  class MenuItemsController < ApplicationController
    before_action :set_menu_item, only: [:edit, :update, :destroy]

    def new
      @menu = Menu.find(params[:menu_id])
      @menu_item = @menu.menu_items.new(parent_id: params[:parent_id])
    end

    def create
      @menu = Menu.find(params[:menu_id])
      @menu_item = @menu.menu_items.new(menu_item_params)

      if @menu_item.save
        redirect_to edit_admin_menu_path(@menu), notice: 'Menu item was successfully created.'
      else
        redirect_to edit_admin_menu_path(@menu), alert: 'Failed to create menu item.'
      end
    end

    def edit
    end

    def update
      if @menu_item.update(menu_item_params)
        redirect_to edit_admin_menu_path(@menu_item.menu), notice: 'Menu item was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @menu_item.destroy
      redirect_to edit_admin_menu_path(@menu_item.menu), notice: 'Menu item was successfully deleted.'
    end

    def update_position
      @menu_item = MenuItem.find(params[:id])
      @menu_item.insert_at(params[:position].to_i)
      head :ok
    end

    private

    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def menu_item_params
      params.require(:menu_item).permit(:title, :url, :parent_id, :position, :menu_id, :type, :type_id)
    end
  end
end
