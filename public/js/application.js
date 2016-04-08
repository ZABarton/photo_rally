$(document).ready(function() {
  $("#logout").on("click", function(){
    var s = document.createElement("script");
    s.src = "https://instagram.com/accounts/logout";
    $("head").append(s);
  })
});
