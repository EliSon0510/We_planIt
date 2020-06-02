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
        document.querySelector("#notification-counter").innerText = +document.querySelector("#notification-counter").innerText +1
        document.querySelector("#dropdown-notification").insertAdjacentHTML('afterbegin', data.body2);
        // notificationContainer.insertAdjacentHTML('beforeend', data);
      }
    })
  }
}

export { initNotificationCable };
