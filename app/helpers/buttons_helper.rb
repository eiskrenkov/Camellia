module ButtonsHelper
  def bootstrap_button_to(title, options = {})
    default_options = {
      class: merge_css('btn btn-primary', options.delete(:class))
    }

    button_tag(title, default_options.merge!(options))
  end
end
