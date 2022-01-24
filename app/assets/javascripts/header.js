/* =============== レスポンシブ：ハンバーガーメニュー用JS =============== */
$(function() {
  $(".openbtn1").click(function () {//ボタンがクリックされたら
    $(this).toggleClass('active');//ボタン自身に activeクラスを付与し
      $(".nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
  });

  $(".nav a").click(function () {//ナビゲーションのリンクがクリックされたら
      $(".openbtn1").removeClass('active');//ボタンの activeクラスを除去し
      $(".nav").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
  });
});
