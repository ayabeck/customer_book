module ApplicationHelper
  # 文字列内に記載されたURLやemail_addressesをリンクとして有効にして返す
  def auto_link_str(str)
    auto_link(h(str), :all, target: '_blank' ) do |link|
      truncate(link, length: 30)
    end
  end

  # テキストをsimple_formatで整形した上で
  # テキスト内に記載されたURLやemail_addressesをリンクとして有効にして返す
  def auto_link_text(text)
    auto_link(simple_format(h(text)), :all, target: '_blank' ) do |link|
      truncate(link, length: 30)
    end
  end

  # usage example
  # <%= simple_form_for(@param) do |f| %>
  #   <div class="form-inputs">
  #   ...
  #   <div class="form-actions">
  #    <%= bootstrap_form_button(f) %>
  #   </div>
  # <% end %>
  def bootstrap_form_button(form)
    content_tag(:div, class: 'form-group') do
      content_tag(:div, class: 'col-wrapper-nolabel') do
        content_tag(:div, class: 'row') do
          content_tag(:div, class: 'col-input') do
            form.button :submit
          end
        end
      end
    end
  end

  # ページごとの完全なタイトルを返す。
  def full_title(page_title)
    base_title = "CustomerBook"
    if page_title.empty?
      base_title
    else
      "#{ base_title } #{ page_title.capitalize }"
    end
  end
end
