<?php
  header('Content-Type: application/json; charset=utf-8');
  
  $pdo = new PDO('mysql:host=localhost;dbname=okapp','root','');
  
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $pdo->exec('SET NAMES "utf8"');
 //1 check 4 isset
  if(isset($_POST['userEmail']) && isset($_POST['userPassword']) && isset($_POST['userName']) && isset($_POST['userLastname'])) {
   //2 try catch
    try{
      //3 change select to insert
    $sql = $pdo->prepare('INSERT INTO userLogin (userName,userLastname,userEmail,userPassword) VALUES (:userName,:userLastname,:userEmail,:userPassword)');
    $sql->execute(array('userName' => $_POST['userName'],
                        'userLastname' => $_POST['userLastname'],
                        'userEmail' => $_POST['userEmail'],
                        'userPassword' => md5($_POST['userPassword'])));
    //4 add get id
    $id = $pdo->lastInsertId();
    $json['status'] = true;
    $json['userId'] = $id;
    $json['msg'] = "";
    }catch(Exception $e) {
      $json['status'] = false;
      $json['msg'] = "การทำงานผิดพลาด";
    } 
   
  }else{
    $json['status'] = false;
    $json['msg'] = "ข้อมูลไม่ถูกต้อง";
  }

  echo json_encode($json);
  ?>