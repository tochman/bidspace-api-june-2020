# frozen_string_literal: true

class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_bidding, only: :create
  def create
    message = @bidding.messages.create(message_params)
    if message.persisted?
      render json: { message: 'Your message was created' }, status: :created
    else
      render json: { message: 'Error' }, status: :bad_request
    end
  end

  private

  def get_bidding
    @bidding = Bidding.find(params[:bidding_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
