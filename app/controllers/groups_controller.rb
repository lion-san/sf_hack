class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "New group created!"
      redirect_to groups_path 
    else
      render 'new'
    end
  end

  def select

    @group = Group.find_by(id: params[:id]) 

    tmp = Array.new
    list = @group.groupjoins
    list.each do |obj|
      tmp.push(User.find_by(id: obj.user_id))
    end 

    @groupusers = tmp

  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private

    def group_params
      params.require(:group).permit(:group_name, :group_detail)
    end
end
