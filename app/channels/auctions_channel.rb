class AuctionsChannel < ApplicationCable::Channel
  def subscribed
    @uuid = params[:uuid]
    stop_all_streams
    stream_from "clock_#{@uuid}"
    @subscribed = true
    logger.info ">>> Subscribed #{@uuid}!"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info ">>> Unsubscribed #{@uuid}!"
    stop_all_streams
    @subscribed = false
  end

  def bid(data)
    ActionCable.server.broadcast "bid-broadcast", { data: data }
  end

end
