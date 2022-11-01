if (/android|iphone|kindle|ipad/i.test(navigator.userAgent)) {
    window.document.querySelector("div#master").style.display = "inline"
} else {
    window.document.querySelector("div#master").style.display = "grid"
}
