class SearchsController < ApplicationController
  def search
    # viewのフォームタグ
    @model = params['model']
    @content = params['content']
    @method = params['method']
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    # ユーザー検索
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%' + content + '%')
      end
      # バー検索
    elsif model == 'bar'
      if method == 'perfect'
        Bar.where(bar_name: content)
      else
        Bar.where('bar_name LIKE ?', '%' + content + '%')
      end
    end
  end
end
