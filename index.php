<?php

require 'vendor/autoload.php';

$config['displayErrorDetails'] = true;

$app = new \Slim\App(["settings" => $config]);

//Conecto con la base de datos
$db = new PDO('mysql:host=localhost;dbname=ingresoGCBA;charset=utf8', 'root', '', array(PDO::ATTR_EMULATE_PREPARES => false,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$db->exec("SET CHARACTER SET utf8");


$app->post('/ingresos', function() use($app, $db) {

    //Accede a los datos recibidos del formulario
    $datosform=$app->request;
    
    $consulta = $db->prepare("select estado from tarjetas where codigo=:codigo and estado=:estado");
    $consulta->bindValue(':codigo',$datosForm->codigo, PDO::PARAM_INT);
    $consulta->bindValue(':estado',$datosForm->estado, PDO::PARAM_STR);
    $consulta->execute();
    $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);

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

$app->get('/historial/{dni}', function($args) use($db) {
    $consulta = $db->prepare("select i.fecha, i.hora, e.nombre, e.apellido from ingresos i, empleados e where i.dni=:param1 and i.idEmpleado=e.id");
    
    // En el execute es dónde asociamos el :param1 con el valor que le toque.
    $consulta->execute(array(':param1' => $args['dni']));

    // Almacenamos los resultados en un array asociativo.
    $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);

    // Devolvemos ese array asociativo como un string JSON.
    echo json_encode($resultados);
});

$app->run();