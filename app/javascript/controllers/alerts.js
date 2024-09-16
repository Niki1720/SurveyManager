document.addEventListener("turbo:load", function () {
    document.body.addEventListener("click", function (event) {
        if (event.target && event.target.classList.contains("close-alert")) {
            event.target.parentElement.remove();
        }
    });
});
