module ApplicationHelper
  def standard_container(id: nil, &block)
    html_attr = {
      class: 'container bg-light pb-5',
    }
    html_attr['id'] = id if id.present?
    content_tag(:div, capture(&block), html_attr)
  end
end
