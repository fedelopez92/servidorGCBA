<?php

require 'vendor/autoload.php';

$config['displayErrorDetails'] = true;

$app = new \Slim\App(["settings" => $config]);

// Allow from any origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
    // Decide if the origin in $_SERVER['HTTP_ORIGIN'] is one
    // you want to allow, and if so:
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');// cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");         

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

}

//Conecto con la base de datos
$db = new PDO('mysql:host=localhost;dbname=ingresoGCBA;charset=utf8', 'root', '', array(PDO::ATTR_EMULATE_PREPARES => false,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$db->exec("SET CHARACTER SET utf8");

$app->get('/', function ($request, $response, $args) use($db) {
    $response->write("Welcome to Slim!");
    return $response; 
});

//Realizo el POST de ingresos
$app->post('/ingresos', function($request, $response, $args) use($db,$app) {

    $datosForm = $request->getParsedBody()['ingreso'];
    
    //Comprueba si el número de la tarjeta el válido
    $consulta = $db->prepare("select codigo from tarjetas where codigo=:codigoTarjeta");
    $consulta->bindValue(':codigoTarjeta',$datosForm['codigoTarjeta'], PDO::PARAM_INT);
    $consulta->execute();
    $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);

    //Si es valido, lo ingresa en la tabla "ingresos"
    if($resultado != null){ 

       $consulta=$db->prepare("insert into ingresos(fecha,hora,codigoTarjeta, dni, nombreEmpleado) 
                                values (:fecha,:hora,:codigoTarjeta, :dni, :nombreEmpleado)");
                            
        $consulta->bindParam(":fecha", $datosForm['fecha']);
        $consulta->bindParam(":hora", $datosForm['hora']);
        $consulta->bindParam(":codigoTarjeta", $datosForm['codigoTarjeta']);
        $consulta->bindParam(":dni", $datosForm['dni']);
        $consulta->bindParam(":nombreEmpleado", $datosForm['nombreEmpleado']);

        $estado=$consulta->execute();

        if ($estado)
            echo json_encode(array('estado'=>true,'mensaje'=>'Se ingresó correctamente'));
        else
            echo json_encode(array('estado'=>false,'mensaje'=>'No se pudo agregar a la tabla'));
      }
    else{
        echo json_encode(array('estado'=>false,'mensaje'=>'La tarjeta no es correcta.'));
    }  
});

//Trae historial de la visita según DNI
$app->get('/historial/{dni}', function($request, $response, $args) use($db) {
    $consulta = $db->prepare("select fecha, hora, nombreEmpleado from ingresos where dni=:param1");
    $consulta->execute(array(':param1' => $args['dni']));
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados);
});

//Consulta al renaper
$app->get('/renaper/{dni}', function($request, $response, $args) use($db) {
    $consulta = $db->prepare("select nombres, apellido, fechaNacimiento, mensaje from renaper where dni=:param1");
    $consulta->execute(array(':param1' => $args['dni']));
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados); 
});

//Trae sectores de los empleados
$app->get('/sectores', function() use($db) {
    $consulta = $db->prepare("select distinct sector from empleados");
    $consulta->execute();
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados); 
});

//Trae nombre y apellido de los empleados de un sector
$app->get('/empleados/{sector}', function($request, $response, $args) use($db) {
    $consulta = $db->prepare("select nombre, apellido from empleados where sector=:param1");
    $consulta->execute(array(':param1' => $args['sector']));
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados); 
});


$app->run();