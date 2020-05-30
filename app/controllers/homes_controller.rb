# frozen_string_literal: true

# home controller
class HomesController < ApplicationController
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_cookings, only: %i[index]

  def index; end
end
