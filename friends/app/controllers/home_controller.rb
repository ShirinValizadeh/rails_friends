# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def about
    @about_me = ' do you want know more about me ...'
  end
end
