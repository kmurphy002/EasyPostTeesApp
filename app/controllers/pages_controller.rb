class PagesController < ApplicationController
  def order
  end
  def tracker
  end
  def ordersubmit
    @page = Page.new
  end
end
