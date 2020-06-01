import consumer from './consumer'

const initNotificationCable = () => {

  const notificationContainer = document.getElementById('notifications')
  console.log(notificationContainer)
  if (notificationContainer) {
    const id = notificationContainer.dataset.userId;
    console.log(id)
    consumer.subscriptions.create({ channel: 'NotificationChannel', id: id }, {
      received(data) {
        console.log(data)
        document.querySelector(".navbar").insertAdjacentHTML("afterend", data.body)
        // notificationContainer.insertAdjacentHTML('beforeend', data);
      }
    })
  }
}

export { initNotificationCable };
