class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # create update destroy 成功時のメッセージ（i18n対応）を生成
  def success_message(controller_name, action_name)
    model_name = I18n.t "activerecord.models.#{ controller_name.singularize }"
    I18n.t "activerecord.messages.success.#{ action_name }", model: model_name
  end
  
  # ダウンロード時のファイル名を生成
  def filename_of(model, format)
    "#{ model.model_name }_#{ Time.zone.now.to_date.to_s }.#{ format }"
  end
end
