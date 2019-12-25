console.log("Hello from form-disappear.js!");
const element = document.querySelector("#disappearing-form");
const button = document.getElementById("formbutton");


button.addEventListener("click", (event) =>{
  console.log("You clicked on the button");
  console.log(event);
  console.log(event.currentTarget);
  // element.classList.add("hidden");
  element.innerHTML = "<p>YOU HAVE SUCCESSFULLY SIGNED UP </p>";
})


// // setTimeout (()=> {
//   // element.classList.add("hidden")
// // }, 5000)
