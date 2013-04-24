class BadgesController < ApplicationController
  respond_to :html
  
  before_filter -> { @badge_set = BadgeSet.find(params[:badge_set_id]) }
  before_filter -> { @badge = Badge.find(params[:id]) }, except: [:create, :new, :index]
  
  def show
    respond_with @badge
  end

  def index
    @badges = @badge_set.badges.page(params[:page]).per(5)
  end

  def new
    @badge = Badge.new
  end

  def edit
    respond_with @badge
  end

  def create
    @badge = @badge_set.badges.new(params[:badge])

    if @badge.save
      redirect_to [@badge_set, @badge], :notice => I18n.t('controllers.badges.actions.create.notice')
    else
      render action: :new
    end

  end

  def update
    if @badge.update_attributes(params[:badge])
      redirect_to badge_set_badges_url(@badge_set), :notice => t('controllers.badges.actions.update.notice')
    else
      render :action => :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to badge_set_badges_url(@badge_set), :notice => t('controllers.badges.actions.destroy.notice')
  end
end
