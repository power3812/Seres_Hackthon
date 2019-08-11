<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Model\Dao\User;


// 会員登録ページコントローラ
$app->get('/register/', function (Request $request, Response $response) {

    //GETされた内容を取得します。
    $data = $request->getQueryParams();

    // Render index view
    return $this->view->render($response, 'register/register.twig', $data);

});

// 会員登録処理コントローラ
$app->post('/register/', function (Request $request, Response $response) {

    //POSTされた内容を取得します
    $data = $request->getParsedBody();

    //ユーザーDAOをインスタンス化
    $user = new User($this->db);

    //入力項目がマッチしない場合エラーを出す 以下エラー処理
    $data["error"] = "";

    //入力されたメールアドレスの会員が登録済みかどうかをチェックします
    if ($user->select(array("email" => $data["email"]), "", "", 1, false)) {
        $data["error"] = "このメールアドレスは既に会員登録済みです";
    }
    //2階入力されたpasswordが一致しない
    if($data["password"]!==$data["password_re"]){
         $data["error"] = "パスワードの再入力に間違いがあります。";
    }
    if(strlen($data["password"])<12){
      $data["error"] = "パスワードは12文字以上に設定してください。";
    }
    if($data["age"]<20){
      $data["error"] = "20歳未満の方は登録できません。";
    }

    if(strlen($data["error"])>0){
      // 入力フォームを再度表示します
      return $this->view->render($response, 'register/register.twig', $data);
    }

    //DB登録に必要ない情報は削除します
    unset($data["password_re"]);

    //passwordをハッシュ化
    $data["password"] = password_hash($data["password"],PASSWORD_DEFAULT);

    //DBに登録をする。戻り値は自動発番されたIDが返ってきます
    $id = $user->insert($data);

    //今登録された情報を発番されたIDで引き、会員情報を取得します（会員登録後の自動ログイン処理のため）
    $result = $user->select(array("id" => $id), "", "", 1, false);

    //セッションにユーザー情報を登録（ログイン処理）
    $this->session->set('user_info', $result);

    // 登録完了ページを表示します。
    return $this->view->render($response, 'register/register_done.twig', $data);

});
