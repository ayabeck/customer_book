module CompaniesHelper
  def timeline(object)
    icon_tag =
        content_tag :span, class: 'fa-stack fa-lg' do
          concat icon('square-o', class: 'fa-stack-2x')
          concat icon(icon_of(object), class: 'fa-stack-1x')
        end
    body_tag =
        content_tag :h5, class: 'media-heading timeline-font' do
          concat message_of(object)
          concat tag 'br'
          concat content_tag :small, object.date_on
        end

    content_tag :div, class: 'media' do
      concat content_tag :div, link_to(icon_tag, url_of(object)), class: 'media-left media-middle'
      concat content_tag :div, body_tag, class: 'media-body'
    end
  end

  private
    def icon_of(object)
      case
        when object.is_a?(Contact)
          'comments-o'
        when object.is_a?(Event)
          'flag-checkered'
        when object.is_a?(Lead)
          'user'
      end
    end

    def message_of(object)
      case
        when object.is_a?(Contact)
          means = "#{ object.means }で" if object.means.present?
          name = "#{ object.lead.name }さんに" if object.lead.name.present?
          "#{ means }#{ name }コンタクト"
        when object.is_a?(Event)
          "イベント「#{ object.name }」に参加"
        when object.is_a?(Lead)
          name = "#{ object.name }さんを" if object.name.present?
          "リードに#{ name }登録"
      end
    end

    def url_of(object)
      case
        when object.is_a?(Contact)
          object.lead
        else
          object
      end
    end
end