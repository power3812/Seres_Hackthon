<?php

use Slim\Http\Request;
use Slim\Http\Response;

// TOPページのコントローラ
$app->get('/logintop/', function (Request $request, Response $response) {

    if(is_null($this->session->user_info ))
    {
      return  $response->withRedirect('/login/');
    }

    $data = [];

    // ログイントップへレンダリング
    return $this->view->render($response, 'logintop/index.twig', $data);
});
