jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    }).hover(function() {
            $(this).css({"background-color": "#ffe1c4", "cursor": "pointer"});
        }, function() {
            $(this).css({"background-color": "#fff9e6", "cursor": "auto"});
        });
});