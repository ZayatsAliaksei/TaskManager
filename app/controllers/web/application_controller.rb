# frozen_string_literal: true
class Web::ApplicationController < ApplicationController
  include AuthHelper  # Change this line
  helper_method :current_user
end
