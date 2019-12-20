module AdminHelper
  def admin_stats_card(model)
    content_tag(:div, class: 'card card-body admin-stats') do
      t("admin.dashboard.amount_of_#{model.model_name.plural}", amount: model.count)
    end
  end
end
