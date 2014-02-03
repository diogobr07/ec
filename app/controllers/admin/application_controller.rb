class Admin::ApplicationController < Admin::BaseApplicationController

  before_action :require_authentication

end
