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
  const newMessage = `<div class='lhs-msg-hold'><p class='agent-message'>${message}</p></div>`;

  messageList.insertAdjacentHTML("afterbegin", newMessage)
}

const addMessageToFormAgent = (message) => {
  const newMessage = `<div class='rhs-msg-hold'><p class='agent-message'>${message}</p></div>`;
  messageList.insertAdjacentHTML("afterbegin", newMessage)
}

const allMessages = ["Hello! Great, nice choice of house", "When would you like to book a viewing?", "Yes, we have 10am or 2pm. Which time works for you?", "Great! You're now booked on to view this property at 10am next Saturday. We will be sending you an email with more information shortly.", "Bye, see you soon."]
let messageCounter = 0

const welcomeVisitor =()=> {
  // const yourName = (document.querySelector("#your-name").value)
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
      setTimeout(welcomeVisitor,800)
    });
  }
}




// get the user information from id - done
// create function eventlisterner
// that triggers - send information to the document
// add information to the dom (appends to the list)
// then insert inforamtion to the client side
export { talkingUser }

