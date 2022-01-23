$(function(){
  //地図の色を条件により変更するメソッド
  function pref_color(pref_n){
    //Memberテーブルのliving_prefectureカラムに格納されている都道府県を赤色に設定
    if (gon.living.some(element => element === pref_n)) {
      return "red"
    }
    //Postテーブルのprefectureカラムに格納されている都道府県を緑色に設定
    else if (gon.visiteds.some(element => element === pref_n)) {
      return "green"
    }
    //その他の色を白に設定
    else {
      return "white"
    }
  }
  
    var areas = [
    {code : 1, color: pref_color(1), prefectures: [1]}, //北海道
    {code : 2, color: pref_color(2), prefectures: [2]}, //青森
    {code : 3, color: pref_color(3), prefectures: [3]}, //岩手
    {code : 4, color: pref_color(4), prefectures: [4]}, //宮城
    {code : 5, color: pref_color(5), prefectures: [5]}, //秋田
    {code : 6, color: pref_color(6), prefectures: [6]}, //山形
    {code : 7, color: pref_color(7), prefectures: [7]}, //福島
    {code : 8, color: pref_color(8), prefectures: [8]}, //茨城
    {code : 9, color: pref_color(9), prefectures: [9]}, //栃木
    {code : 10,color: pref_color(10), prefectures: [10]}, //群馬
    {code : 11,color: pref_color(11), prefectures: [11]}, //埼玉
    {code : 12, color: pref_color(12), prefectures: [12]}, //千葉
    {code : 13, color: pref_color(13), prefectures: [13]}, //東京
    {code : 14, color: pref_color(14), prefectures: [14]}, //神奈川
    {code : 15, color: pref_color(15), prefectures: [15]}, //新潟
    {code : 16, color: pref_color(16), prefectures: [16]}, //富山
    {code : 17, color: pref_color(17), prefectures: [17]}, //石川
    {code : 18, color: pref_color(18), prefectures: [18]}, //福井
    {code : 19, color: pref_color(19), prefectures: [19]}, //山梨
    {code : 20, color: pref_color(20), prefectures: [20]}, //長野
    {code : 21, color: pref_color(21), prefectures: [21]}, //岐阜
    {code : 22, color: pref_color(22), prefectures: [22]}, //静岡
    {code : 23, color: pref_color(23), prefectures: [23]}, //愛知
    {code : 24, color: pref_color(24), prefectures: [24]}, //三重
    {code : 25, color: pref_color(25), prefectures: [25]}, //滋賀
    {code : 26, color: pref_color(26), prefectures: [26]}, //京都
    {code : 27, color: pref_color(27), prefectures: [27]}, //大阪
    {code : 28, color: pref_color(28), prefectures: [28]}, //兵庫
    {code : 29, color: pref_color(29), prefectures: [29]}, //奈良
    {code : 30, color: pref_color(30), prefectures: [30]}, //和歌山
    {code : 31, color: pref_color(31), prefectures: [31]}, //鳥取
    {code : 32, color: pref_color(32), prefectures: [32]}, //島根
    {code : 33, color: pref_color(33), prefectures: [33]}, //岡山
    {code : 34, color: pref_color(34), prefectures: [34]}, //広島
    {code : 35, color: pref_color(35), prefectures: [35]}, //山口
    {code : 36, color: pref_color(36), prefectures: [36]}, //徳島
    {code : 37, color: pref_color(37), prefectures: [37]}, //香川
    {code : 38, color: pref_color(38), prefectures: [38]}, //愛媛
    {code : 39, color: pref_color(39), prefectures: [39]}, //高知
    {code : 40, color: pref_color(40), prefectures: [40]}, //福岡
    {code : 41, color: pref_color(41), prefectures: [41]}, //佐賀
    {code : 42, color: pref_color(42), prefectures: [42]}, //長崎
    {code : 43, color: pref_color(43), prefectures: [43]}, //熊本
    {code : 44, color: pref_color(44), prefectures: [44]}, //大分
    {code : 45, color: pref_color(45), prefectures: [45]}, //宮崎
    {code : 46, color: pref_color(46), prefectures: [46]}, //鹿児島
    {code : 47, color: pref_color(47), prefectures: [47]}, //沖縄
  ];

  //japan_mapの設定
  $("#map-container").japanMap({
    width: 400,  //マップ表示幅(正方形)
    areas: areas,  //areasの配列データによるマップ生成
    borderLineColor: "gray",   //県境の線(色)
    drawsBoxLine: false,  //枠線の有無
  });
});