<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Model\Dao\User;
use Controller\login\index;


/*
// recommend/index.twigのテスト用ルーティング
// ここのコメントアウトを取る場合は、use Model\Dao\Alc;以下をコメントアウト
$app->get('/recommend/', function (Request $request, Response $response) {
    // Render index view
    return $this->view->render($response, 'recommend/index.twig');
});*/

use Model\Dao\Alc;

use Model\Dao\History;

// ログイン画面コントローラ





// ログインロジックコントローラ
$app->get('/report/', function (Request $request, Response $response) {

    if(is_null($this->session->user_info )){
      return  $response->withRedirect('/login/');
    }

    //ユーザーDAOをインスタンス化
    $alc = new Alc($this->db);
    $his = new History($this->db);
    $user = new User($this->db);




    $r = rand(1,10);

    //$param["name"] = $data["name"];
    //$param["picpass"] = $data["picpass"];
    //$param["exppass"] = $data["exppass"];
    $param["user_id"] =(int) $this->session->user_info["id"];


    //入力された情報から会員情報を取得
    $result = $his ->select($param, "time", "ASC", "",true);
    //var_dump($result[0]["time"]);

    //結果が取得できたらログイン処理を行い、TOPへリダイレクト
    if($result){





    } else {
        //入力項目がマッチしない場合エラーを出す
        echo "false";

    }

    // Render index view
    return  $this->view->render($response, 'report/index.twig',["date"=>$result[1]["time"]]);;

});
