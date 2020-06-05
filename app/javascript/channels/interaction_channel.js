import consumer from './consumer'

const initInteractionCable = () => {

  const messageContainer = document.getElementById('chat')
  console.log(messageContainer)
  if (messageContainer) {
    const id = messageContainer.dataset.interactionId;
    console.log(id)
    consumer.subscriptions.create({ channel: 'InteractionChannel', id: id }, {
      received(data) {
        console.log(data)
        console.log(messageContainer)
        messageContainer.insertAdjacentHTML('beforeend', data);
      }
    })
  }
}

export { initInteractionCable };

