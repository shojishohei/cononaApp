class FilesController < ApplicationController
  def index
    @beforeposts = current_user.beforeposts.all
    
    # 今回は使用しないですが、接触者の一覧を取得するには以下のようにするといけます。 by 依知川
    # @contact_persons=@beforeposts.map { |bp| bp.contact_persons.all }
    # logger.info "接触者 #{@contact_persons.inspect}"
    send_data render_to_string, filename: "(ファイル名：).csv", type: :csv

  end
end