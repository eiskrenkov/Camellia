module NavbarHelper
  def navbar_tag(&block)
    content_tag(:nav, class: 'nav navbar navbar-expand-lg fixed-top navbar-dark bg-dark') do
      content_tag(:div, capture(&block), class: 'container')
    end
  end

  def navbar_collapse_button
    bootstrap_icon_button(
      '', 'bars', class: 'navbar-toggler', data: { toggle: 'collapse', target: '#collapse-content' },
                  aria: { controls: 'collapse-content', expanded: false, label: 'toggle' }
    )
  end

  def navbar_collapse_section(&block)
    content_tag(:div, capture(&block), class: 'collapse navbar-collapse', id: 'collapse-content')
  end

  def navbar_brand
    link_to(application_name, root_path, class: 'navbar-brand')
  end

  def navbar_links_set(position: :auto, &block)
    content_tag(:ul, capture(&block), class: "navbar-nav mr-#{position}")
  end

  def navbar_link(title, url, options = {})
    section = options.delete(:section)

    default_options = {
      class: 'nav-link ' + (belongs_to_navigation_section?(section) ? 'active' : '')
    }

    content_tag(:li, link_to(title, url, default_options.merge!(options)), class: 'nav-item')
  end

  def navbar_dropdown(title, options = {}, &block)
    indentifier = SecureRandom.uuid
    active = belongs_to_navigation_section?(options.delete(:section))

    content = safe_join [
      link_to(
        title, '', class: 'nav-link dropdown-toggle ' + (active ? 'active' : ''), id: indentifier, role: :button,
                   data: { toggle: :dropdown }, aria: { haspopup: true }
      ),
      content_tag(:div, capture(&block), class: 'dropdown-menu', aria: { labelledby: indentifier })
    ]

    content_tag(:li, content, class: 'nav-item dropdown')
  end

  def navbar_dropdown_link(text, url, options = {})
    link_to(text, url, options.merge!(class: 'dropdown-item'))
  end

  def navbar_authentication_dropdown
    navbar_dropdown(current_user.email, section: :profile) do
      safe_join [
        navbar_dropdown_link(
          safe_join([fa_icon('user'), ' ', t('shared.profile')]), root_path
        ),
        navbar_dropdown_link(
          safe_join([fa_icon('sign-out-alt'), ' ', t('shared.log_out')]), destroy_user_session_path, method: :delete
        )
      ]
    end
  end
end
