class Admin::WelcomeController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @visits = Visit.all.count
    @workshops = Workshop.all.count
    @talks = Artist.all.count
    @residancy = Residancy.all.count
  end

end
