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

const addMessageToForm = (message) => {
  const newMessage = `<li>${message}</li>`;
  messageList.insertAdjacentHTML("afterbegin", newMessage)
}

if (submit) {
  messageForm.addEventListener(submit, (e) => {
    e.preventDefault();
    const userMessage = document.querySelector("#your-message").value;
    addMessageToForm(userMessage);
    setTimeout(welcomeVisitor,10000)
  });
}


const agentTalksBack = () =>{
  const yourName = (document.querySelector("#your-name").value)
  const yourMessage = (document.querySelector("#your-message").value)
  const button = document.querySelector("#button")
  button.addEventListener("click", function(){

  })

}

const allMessages = ["1", "2"]
let messageCounter = 0

const welcomeVisitor =()=>{
const myMessage = allMessages[messageCounter]
messageCounter += 1
addMessageToForm(myMessage);

}
// get the user information from id - done
// create function eventlisterner
// that triggers - send information to the document
// add information to the dom (appends to the list)
// then insert inforamtion to the client side

export { agentTalksBack }
