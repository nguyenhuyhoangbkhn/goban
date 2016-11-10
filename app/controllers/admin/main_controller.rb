class Admin::MainsController < ApplicationController
  load_and_authorize_resource :user, :provincial
  def index
  end
end