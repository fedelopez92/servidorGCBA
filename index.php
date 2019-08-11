<?php

require 'vendor/autoload.php';

$config['displayErrorDetails'] = true;

$app = new \Slim\App(["settings" => $config]);

//Conecto con la base de datos
$db = new PDO('mysql:host=localhost;dbname=ingresoGCBA;charset=utf8', 'root', '', array(PDO::ATTR_EMULATE_PREPARES => false,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$db->exec("SET CHARACTER SET utf8");

//Realizo el POST de ingresos
$app->post('/ingresos', function() use($app, $db) {

    $datosform=$app->request;
    
    //Comprueba si el número de la tarjeta el válido
    $consulta = $db->prepare("select estado from tarjetas where codigo=:codigo and estado=:estado");
    $consulta->bindValue(':codigo',$datosForm->codigo, PDO::PARAM_INT);
    $consulta->bindValue(':estado',$datosForm->estado, PDO::PARAM_STR);
    $consulta->execute();
    $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);

    //Si es valido, lo ingresa en la tabla "ingresos"
    if($resultado->estado == "habilitado"){

        $consulta=$db->prepare("insert into ingresos(fecha,hora,codigoTarjeta, dni, idEmpleado) 
                                values (:fecha,:hora,:codigoTarjeta, :dni, :idEmpleado)");
                            
        $estado=$consulta->execute(
            array(
                ':fecha'=> $datosform->post('fecha'),
                ':hora'=> $datosform->post('hora'),
                ':codigoTarjeta'=> $datosform->post('codigoTarjeta'),
                ':dni'=> $datosform->post('dni'),
                ':idEmpleado'=> $datosform->post('idEmpleado')
                )
            );

        if ($estado)
            echo json_encode(array('estado'=>true,'mensaje'=>'Datos insertados correctamente.'));
        else
            echo json_encode(array('estado'=>false,'mensaje'=>'No se pudo insertar. Código de error: '$response->getStatusCode()));

    }
    else{
        echo json_encode(array('estado'=>false,'mensaje'=>'La tarjeta no es correcta.'));
    }
});

//Trae historial de la visita según DNI
$app->get('/historial/{dni}', function($args) use($db) {
    $consulta = $db->prepare("select i.fecha, i.hora, e.nombre, e.apellido from ingresos i, empleados e where i.dni=:param1 and i.idEmpleado=e.id");
    $consulta->execute(array(':param1' => $args['dni']));
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados);
});

//Consulta al renaper
$app->get('/renaper/{dni}', function($args) use($db) {
    $consulta = $db->prepare("select nombres, apellido, fechaNacimiento, mensaje from renaper where dni=:param1");
    $consulta->execute(array(':param1' => $args['dni']));
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultados); 
});

$app->run();