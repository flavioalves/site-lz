class ClientsController < ApplicationController
  before_action :authenticate_user!
  layout "pages"

  def index; end
end
