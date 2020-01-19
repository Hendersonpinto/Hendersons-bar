console.log("Hello from banner.js!");
let isIphone = navigator.userAgent.match(/iPhone/i) != null;
let isAndroid = navigator.userAgent.match(/Android/i)  != null;

if(isIphone)
{
    console.log("You are using an iphone");
    let mybanner = document.querySelector(".banner");
    if (mybanner) {
    console.log(`${mybanner}`);
    mybanner.classList.add('iphonebg');
    console.log("Class was added")
    }
}