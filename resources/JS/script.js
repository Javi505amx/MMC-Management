function disableBack() { window.history.forward(); }
setTimeout("disableBack()", 0);
window.onunload = function () { null };