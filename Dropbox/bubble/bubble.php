<?php
header("Content-Type: text/html; charset=UTF-8");
$data = array();
//朝日新聞 http://rss.asahi.com/rss/asahi/newsheadlines.rdf
$rss = simplexml_load_file('http://himasoku.com/index.rdf');
foreach ($rss->item as $item) {
    $x[] = (string)$item->title;
    //$data[] = $x;
}
var_dump($x);

$appid = 'dj0zaiZpPVhXdG15cEZwTXgxUSZzPWNvbnN1bWVyc2VjcmV0Jng9YWM-';
$word = implode("",$x);
$url = "http://jlp.yahooapis.jp/MAService/V1/parse?appid=".$appid."&results=ma&sentence=".urlencode($word);
$parse = simplexml_load_file($url);
foreach($parse->ma_result->word_list->word as $value){
  echo $value->surface;
  echo "／";
}
echo "<br>";
echo "ijbijgibjsfoibjs;";
?>