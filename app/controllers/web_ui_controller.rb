class WebUiController < ApplicationController

  before_action :login?, except: [:login, :sessions, :layout]

  rescue_from CanCan::AccessDenied do |exception|
    session.delete(:user_id)
    cookies.delete(:user)
    redirect_to login_path, :alert => 'Access Denied'
  end

  def login
    render 'login', layout: nil
  end

  def logout
    session.delete(:user_id)
    cookies.delete(:user)
    redirect_to login_path
  end

  def sessions
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id.to_s
      cookies[:user] = user_info(user)
      if user.role == 'admin'
        redirect_to admin_path
      else
        redirect_to root_path
      end
    else
      @error = true
      render 'login', layout: nil
    end
  end

  def index
    authorize! :user_access, :page
    render 'home', layout: nil
  end

  def admin
    authorize! :admin_access, :page
    render 'admin', layout: nil
  end

  def admin_all
    render partial: 'web_ui/admin/all', layout:nil
  end

  def admin_new
    render partial: 'web_ui/admin/new', layout: nil
  end

  def admin_edit
    render partial: 'web_ui/admin/edit', layout: nil
  end

  def food_index
    render partial: 'web_ui/food/index', layout: nil
  end

  private

  def user_info(user)
    {
        id: user.id.to_s,
        username: user.username,
        role: user.role,
        expires: 1.hour.from_now
    }.to_json
  end

  def login?
    json = cookies[:user].blank? ? {} : JSON.parse(cookies[:user])
    if json['id'].blank? || json['id'] != session['user_id']
      redirect_to login_path
    end
  end

end