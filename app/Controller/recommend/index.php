<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Model\Dao\User;
use Model\Dao\Alc;
use Controller\login\index;


// ログインロジックコントローラ
$app->get('/recommend/', function (Request $request, Response $response) {

    if(is_null($this->session->user_info )){
      return  $response->withRedirect('/login/');
    }

    //ユーザーDAOをインスタンス化
    $alc_data = new Alc($this->db);

    //乱数生成
    $random_num = rand(1,10);

    //selectのための条件
    $alc_param["id"] = $random_num;

    //入力された情報から会員情報を取得
    $result = $alc_data->select($alc_param, "", "", 1,false);

    //結果が取得できたらログイン処理を行い、TOPへリダイレクト
    if(!$result)
    {
        //入力項目がマッチしない場合エラーを出す
        echo "false";

    }

    // Render index view
    return  $this->view->render($response, 'recommend/index.twig', ["result"=>$result]);;

});
