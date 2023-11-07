<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require './vendor/autoload.php';

$app = new \Slim\App;


function padrao(Request $request, Response $response, array $args)
{
    $padrao = "";
    return $padrao;
}

$app->get('/','padrao');
$app->get('/getNome/{usuario}','getNome');
$app->get('/getEmail/{usuario}','getEmail');
$app->get('/getICMS/{estadosTransporte}','getICMS');


function getConn()
{
    return new PDO('mysql:host=localhost:3306;dbname=db_compassv2',
    'root',
    '',
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
}

function getNome(Request $request, Response $response, array $args)
{
    $nome = $args['usuario'];
    $conn = getConn();
    $sql = "SELECT * FROM tb_usuario WHERE nm_nome_completo=:nome";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam("nome",$nome);
    $stmt->execute();
    $produto = $stmt->fetchObject();

    $response->getBody()->write(json_encode($produto));
    return $response;
}

function getEmail(Request $request, Response $response, array $args)
{
    $usuario = $args['usuario'];
    $conn = getConn();
    $sql = "SELECT * FROM tb_email_usuario WHERE cd_usuario=:usuario";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam("usuario",$usuario);
    $stmt->execute();
    $email = $stmt->fetchObject();

    $response->getBody()->write(json_encode($email));
    return $response;
}

function getICMS(Request $request, Response $response, array $args)
{
    $estadosTransporte = $args['estadosTransporte'];
    $conn = getConn();
    $sql = "SELECT * FROM tb_icms WHERE sg_icms=:estadosTransporte";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam("estadosTransporte",$estadosTransporte);
    $stmt->execute();
    $icms = $stmt->fetchObject();

    $response->getBody()->write(json_encode($icms));
    return $response;
}

$app->run();