import consumer from './consumer'

const messageContainer = document.getElementById('messages')

if (messageContainer) {
  const id = messageContainer.dataset.interactionId;
  consumer.subscriptions.create({ channel: 'InteractionChannel', id: id }, {
    received(data) {
      console.log(data)
      // messageContainer.insertAdjacentHTML('beforeend', data);
    }
  })
}
