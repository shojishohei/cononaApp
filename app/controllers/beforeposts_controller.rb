class BeforepostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy,:update]

  def create
    @beforepost = current_user.beforeposts.build(beforepost_params)
    if @beforepost.save
      # flash[:success] = "Beforepost created!"
      # UserMailer.sendmail.deliver_now
      redirect_to before_path
      
    else
      @feed_items=current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def show
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  
  def before
    @feed_items = current_user.feed.where(ended_at: nil).paginate(page: params[:page])
    
  end
  
  # 
  def edit
    @beforepost=Beforepost.find(params[:id])
    @beforepost.contact_persons.build
  end


  def update
    @beforepost=Beforepost.find(params[:id])
    if @beforepost.update(beforepost_params)
    @feed_items = current_user.feed.paginate(page: params[:page])
    redirect_to show_path,notice:"タスクを更新しました。"
    else
      # redirect_to edit_beforepost_path(@beforepost)
      render 'beforeposts/edit'
    end
  end
  
  def destroy
    beforepost=Beforepost.find(params[:id])
    beforepost.destroy
    redirect_to show_path,notice:"1件削除しました。"
  end

  private
#あっているか微妙(「contact_people」に紐づけられているものと判断しname追加)#
    def beforepost_params
      params.require(:beforepost).permit(:started_at,:content,:ended_at,:place,:remarks,contact_persons_attributes:[:name,:description])
    end
end
