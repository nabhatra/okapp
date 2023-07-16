<?php
  header('Content-Type: application/json; charset=utf-8');
  
  $pdo = new PDO('mysql:host=localhost;dbname=okapp','root','');
  
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $pdo->exec('SET NAMES "utf8"');
 
  if(isset($_POST['userEmail']) && isset($_POST['userPassword'])) {

    $sql = $pdo->prepare('SELECT * FROM userLogin WHERE userEmail=:userEmail AND userPassword=:userPassword');
    $sql->execute(array('userEmail' => $_POST['userEmail'],
                        'userPassword' => md5($_POST['userPassword'])));
    
    if($sql->rowCount() == 0 ){
      $json['status'] = false;
      $json['msg'] = "อีเมล หรือรหัสผ่านผิดพลาด";
    }else{
      $data = $sql->fetch();
      $json['status'] = true;
      $json['msg'] = "";
      $json['name'] = $data['userName'];
      $json['lastname'] = $data['userLastname'];
      $json['userId'] = $data['userId'];
    }
  }else{
    $json['status'] = false;
    $json['msg'] = "ข้อมูลไม่ถูกต้อง";
  }

  echo json_encode($json);
  ?>