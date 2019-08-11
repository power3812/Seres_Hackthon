<?php

use Slim\Http\Request;
use Slim\Http\Response;

// TOPページのコントローラ
$app->get('/', function (Request $request, Response $response) {
  if(!is_null($this->session->user_info )){
    return  $response->withRedirect('/logintop/');
  }
    $data = [];

    // Render index view
    return $this->view->render($response, 'top/index.twig', $data);
});
