class Settings < Settingslogic
  source "#{Rails.root}/config/parameter.yml"
  namespace Rails.env
end