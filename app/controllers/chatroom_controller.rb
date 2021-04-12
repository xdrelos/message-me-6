class ChatroomController < ApplicationController
  before_action :require_user
  
  def index
    @message = Message.new
    @messages = Message.render_msg_limited
  end
  
end
