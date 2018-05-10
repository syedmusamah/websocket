class CommentRelayJob < ApplicationJob
  def perform(data)
    ActionCable.server.broadcast "bid-broadcast", { data: data }
  end
end
