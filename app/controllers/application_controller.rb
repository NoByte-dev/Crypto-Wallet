class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :breadcrumbs

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(label, path = nil)
    breadcrumbs << Breadcrumb.new(label, path)
  end

  private

  def set_locale
    update_locale(params[:locale] || cookies[:locale])
  end

  def update_locale(locale)
    return if locale.blank? || I18n.locale == locale

    cookies[:locale] = locale
    I18n.locale = locale
  end
end
