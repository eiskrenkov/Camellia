module ButtonsHelper
  def bootstrap_button(title, options = {})
    size = options.delete(:size)
    type = options.delete(:type) || :link

    css_classes = %w[btn btn-primary]
    css_classes << "btn-#{size}" if size.present?

    default_options = {
      class: merge_css(css_classes, options.delete(:class))
    }

    if type == :link
      link_to(title, options.delete(:url), default_options.merge!(options))
    else
      default_options[:type] = type
      button_tag(title, default_options.merge!(options))
    end
  end

  def bootstrap_icon_button(title, icon, options = {})
    bootstrap_button(
      "#{fa_icon(icon)} #{title}".html_safe, options # rubocop:disable Rails/OutputSafety
    )
  end

  def new_button(options = {})
    default_options = {
      class: 'btn-success',
      url: new_resource_path
    }

    bootstrap_icon_button(t('shared.new'), 'plus', default_options.merge(options))
  end

  def edit_button(resource, options = {})
    default_options = {
      class: 'btn-info',
      size: :xs
    }
    options[:url] ||= edit_resource_path(resource) || ''

    bootstrap_icon_button(t('shared.edit'), 'edit', default_options.merge(options))
  end

  def show_button(resource, options = {})
    default_options = {
      class: 'btn-info',
      size: :xs
    }
    options[:url] ||= resource_path(resource) || ''

    bootstrap_icon_button(t('shared.show'), 'eye', default_options.merge(options))
  end

  def delete_button(resource, options = {})
    data_attributes = options.delete(:data) || {}
    default_options = {
      method: :delete,
      data: data_attributes.reverse_merge(confirm: t('confirmations.deletion')),
      class: 'btn-danger',
      size: :xs
    }

    options[:url] ||= resource_path(resource) || ''

    bootstrap_icon_button(t('shared.delete'), 'trash', default_options.merge(options))
  end

  def save_button(options = {})
    default_options = {
      type: :submit,
      class: 'btn-primary'
    }

    bootstrap_icon_button(t('shared.save'), 'save', default_options.deep_merge(options))
  end

  def cancel_button(options = {})
    default_options = {
      class: 'btn-primary'
    }

    options[:url] ||= collection_path

    bootstrap_icon_button(t('shared.cancel'), 'ban', default_options.merge(options))
  end

  def export_button(options = {})
    default_options = {
      class: 'btn-secondary',
      size: :xs
    }

    bootstrap_icon_button(t('shared.export'), 'file-export', default_options.merge(options))
  end

  def import_button(options = {})
    default_options = {
      class: 'btn-secondary',
      size: :xs
    }
    # TODO: Replace with actual import action
    options[:url] ||= root_path

    bootstrap_icon_button(t('shared.import'), 'file-import', default_options.merge(options))
  end

  def remove_association_button(form, options = {})
    default_options = {
      class: 'btn btn-danger'
    }

    link_to_remove_association fa_icon('trash'), form, default_options.merge!(options)
  end

  def collection_filters(filters)
    return if filters.blank?

    filter_buttons = filters.map.with_index do |filter, index|
      css = index.zero? && !params[:filter] || params[:filter] == filter ? 'active' : ''

      bootstrap_button(
        filter.capitalize, url: collection_path(filter: filter), class: css, size: :sm, btn_style: :secondary
      )
    end

    content_tag(:div, safe_join(filter_buttons), class: 'btn-group collection-filters')
  end
end
