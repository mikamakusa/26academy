<?

$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL => 'http://172.28.128.4/id',
    CURLOPT_USERAGENT => 'Codular Sample cURL Request'
));

$result = curl_exec($curl);
$json = json_decode($result, true);
$id = $json['id'];

curl_setopt_array($curl, array(
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL => 'http://172.28.128.4/footstep/$id',
    CURLOPT_USERAGENT => 'Codular Sample cURL Request'
));

$result = curl_exec($curl);
$json = json_decode($result, true);
$foot = $json['footstep'];

curl_setopt_array($curl, array(
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL => 'http://172.28.128.4/heartbeat/$id',
    CURLOPT_USERAGENT => 'Codular Sample cURL Request'
));

$result = curl_exec($curl);
$json = json_decode($result, true);
$heart = $json['heartbeat'];

echo "id bracelet $id | footsteps $foot | heartbeat $heart";

?>