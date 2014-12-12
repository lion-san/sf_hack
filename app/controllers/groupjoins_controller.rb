class GroupjoinsController < ApplicationController
  before_action :signed_in_user

  def create
    currnet_group(Group.find(params[:groupjoin][:group_id]))
    #logger.debug("=========================================")
    #logger.debug(params[:groupjoin][:group_id])
    @currentg.join!(current_user)
    redirect_to groups_path  #non Ajax
    #respond_to do |format|
    #  format.html { redirect_to groups_path }
    #  format.js
    #end
  end

  def destroy
    currnet_group(Groupjoin.find(params[:id]).group_id)
    Group.find((Groupjoin.find(params[:id])).group_id).unjoin(current_user)
    redirect_to groups_path  #non Ajax
    #respond_to do |format|
    #  format.html { redirect_to @user }
    #  format.js
    #end
  end

  private
    def currnet_group(group)
      @currentg = group
#logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") 
#logger.debug(@currentg) 
    end

end

