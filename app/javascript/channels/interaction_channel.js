import consumer from './consumer'

const initInteractionCable = () => {

  const messageContainer = document.getElementById('messages')
  console.log(messageContainer)
  if (messageContainer) {
    const id = messageContainer.dataset.interactionId;
    console.log(id)
    consumer.subscriptions.create({ channel: 'InteractionChannel', id: id }, {
      received(data) {
        console.log(data)
        messageContainer.insertAdjacentHTML('beforeend', data);
      }
    })
  }
}

export { initInteractionCable };
