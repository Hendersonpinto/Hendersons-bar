console.log("Hello from banner.js!");
let isIphone = navigator.userAgent.match(/iPhone/i) != null;
let isAndroid = navigator.userAgent.match(/Android/i)  != null;

if(isIphone)
{
    let banner = document.querySelector(".banner");
    banner.addClass('iphonebg');
    console.log("Class was added")
}