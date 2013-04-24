class BadgeSetsController < ApplicationController
  respond_to :html, only: [:print, :index, :edit]

  layout 'print', only: [:print]
  
  before_filter :assign_badge_set, :only => [:print, :edit, :update, :destroy]
  
  def print
  end
  
  def index
    @badge_sets = BadgeSet.page(params[:page]).per(20)
  end

  def new
    @badge_set = BadgeSet.new
  end

  def edit
  end

  def create
    @badge_set = BadgeSet.new(params[:badge_set])

    if @badge_set.save
      redirect_to badge_set_badges_url(@badge_set), :notice => I18n.t('controllers.badge_sets.actions.create.notice')
    else
      render :action => :new
    end
  end

  def update
    if @badge_set.update_attributes(params[:badge_set])
      redirect_to badge_set_badges_url(@badge_set), :notice => I18n.t('controllers.badge_sets.actions.update.notice')
    else
      render :action => :edit
    end
  end

  def destroy
    if @badge_set.destroy
      redirect_to badge_sets_url, :notice => I18n.t('controllers.badge_sets.actions.destroy.notice')
    else
      redirect_to :index
    end
  end

  private
  def assign_badge_set
    @badge_set = BadgeSet.find(params[:id])
  end
end
