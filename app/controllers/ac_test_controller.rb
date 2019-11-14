class AcTestController < ApplicationController
  def index
    @message = AcMessage.new
  end
end
