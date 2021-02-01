class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  # createメソッド=オブジェクトの生成 + データの保存
  def create
    Message.create(message_params)
  end

  private
  # paramsはHTTPリクエストパラメーター(入力データ)のハッシュが格納されている変数
  def message_params
    params.require(:message).permit(:title,:content)
  end
end
