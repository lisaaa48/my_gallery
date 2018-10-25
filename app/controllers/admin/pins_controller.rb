class Admin::PinsController < ApplicationController

  before_action :authenticate_user!

end
