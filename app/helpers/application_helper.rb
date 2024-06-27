module ApplicationHelper
  def set_required_label(model, attribute)
    label_name = t("activerecord.attributes.#{model}.#{attribute}")
    "#{label_name}  ※"
  end
end
