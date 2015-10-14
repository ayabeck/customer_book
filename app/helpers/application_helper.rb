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
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'col-wrapper-nolabel' do
        content_tag :div, class: 'row' do
          content_tag :div, class: 'col-input' do
            form.button :submit, data: { disable_with: '処理中...' }
          end
        end
      end
    end
  end

  def form_errors(instance)
    if instance.errors.any?
      content_tag :div, class: 'panel panel-danger' do
        concat(content_tag :div, I18n.t('simple_form.error_notification.default_message'), class: 'panel-heading')
        body = content_tag :div, class: 'panel-body' do
          content_tag :ul, class: 'list-unstyled' do
            instance.errors.full_messages.each do |msg|
              concat(content_tag :li, msg)
            end
          end
        end
        concat(body)
      end
    end
  end

  def page_title(controller_name)
    base_title = 'CustomerBook'
    "#{ base_title } #{ I18n.t("activerecord.models.#{ controller_name.singularize }") }"
  end

  def page_header(controller_name, action_name)
    content_tag :div, class: 'page-header' do
      content_tag :h2 do
        concat I18n.t("activerecord.models.#{ controller_name.singularize }")
        concat content_tag :small, I18n.t("action.#{ action_name }")
      end
    end
  end
end
