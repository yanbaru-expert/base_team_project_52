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

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  # updateは、オブジェクト生成しないのでインスタンスをDBから取得する
  def update
    message = Message.find(params[:id])
    message.update(message_params)
  end

  private
  # paramsはHTTPリクエストパラメーター(入力データ)のハッシュが格納されている変数
  def message_params
    params.require(:message).permit(:title,:content)
  end
end
