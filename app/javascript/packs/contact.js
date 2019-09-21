// get the form and store it in variable
// add event listener to the form for submit
  // prevent the form submitting
  // get the message
  // add it to the message list
  // clear the form
  // add the response message



const messageForm = document.querySelector('#comment-form');
const messageList = document.querySelector('#messages ul');
const submit = document.querySelector("#submit_comment");

const addMessageToFormUser = (message) => {
  const newMessage = `<div class='user-message'>${message}<div>`;

  messageList.insertAdjacentHTML("afterbegin", newMessage)
}

const addMessageToFormAgent = (message) => {
  const newMessage = `<div class='agent-message'>${message}</div>`;
  messageList.insertAdjacentHTML("afterbegin", newMessage)
}

const allMessages = ["Hello, there are you", "2"]
let messageCounter = 0

const welcomeVisitor =()=> {
  const yourName = (document.querySelector("#your-name").value)
  const yourMessage = (document.querySelector("#your-message").value)
  const myMessage = allMessages[messageCounter]
  messageCounter += 1
  addMessageToFormAgent(myMessage);

}

const talkingUser = () => {
  if (messageForm) {
    messageForm.addEventListener("submit", (e) => {
      e.preventDefault();
      const userMessage = document.querySelector("#your-message");
      addMessageToFormUser(userMessage.value);
      userMessage.value=''
      setTimeout(welcomeVisitor,8000)
    });
  }
}




// get the user information from id - done
// create function eventlisterner
// that triggers - send information to the document
// add information to the dom (appends to the list)
// then insert inforamtion to the client side
export { talkingUser }

