json.array! @notifications do |notification|
  json.id notification.id
  json.template render partial: "notifications/#{notification.notifiab
  le_type.underscore.pluralize}/#{notifi
  cation.action}", locals: {notification: notification}, formats: [:html]

end
