module FlashHelper

  def flash_class(level)
    case level
      when 'notice' then content_tag(:span, 'Notice:', class: 'text-blue-700 header-font tracking-tight font-semibold')
      when 'success' then content_tag(:span, 'Success:', class: 'text-green-700 header-font tracking-tight font-semibold')
      when 'error' then content_tag(:span, 'Error:', class: 'text-orange-700 header-font tracking-tight font-semibold')
      when 'alert' then content_tag(:span, 'Alert:', class: 'text-red-700 header-font tracking-tight font-semibold')
    end
  end

  def flash_icon(icon)
    case icon
      when 'notice' then content_tag(:i, '', class: 'far fa-info-circle text-blue-500 fa-lg')
      when 'success' then content_tag(:i, '', class: 'far fa-check-circle text-green-500 fa-lg')
      when 'error' then content_tag(:i, '', class: 'far fa-exclamation-triangle text-orange-500 fa-lg')
      when 'alert' then content_tag(:i, '', class: 'far fa-times-circle text-red-500 fa-lg')
    end
  end
end