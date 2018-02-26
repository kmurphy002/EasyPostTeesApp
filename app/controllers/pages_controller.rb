class PagesController < ApplicationController
  def order
    @page = Page.new
  end
  def tracker
  end
  def pages
    @page = Page.new
  end
end
