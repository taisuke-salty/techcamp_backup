window.addEventListener("load", function(){
  var btn = document.querySelector("input");
  // ボタンをDOMオブジェクトとして取得し、変数btnに代入する
  btn.addEventListener("click", function(){
    var p = document.querySelector("p");

    p.innerText = "クリックされた！";
  });
});

  
$(window).on("load", function() {
  $("li").on("click", function() {
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents div").hide();
    $("." + this.id).show();
  });
});




