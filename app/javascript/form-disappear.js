console.log("Hello from form-disappear.js!");
let element = document.querySelector("#disappearing-form");
let button = document.getElementById("formbutton");
if (button){
button.addEventListener("click", (event) =>{
  console.log(event.currentTarget);
  // element.classList.add("hidden");
  element.innerHTML = "<p>YOU HAVE BEEN SUCCESSFULLY SIGNED UP </p>";
})}


// // setTimeout (()=> {
//   // element.classList.add("hidden")
// // }, 5000)
