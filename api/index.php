<?php

require __DIR__ . '/../core/init.php';


/**
 * Categories section
 */

//All categories
$app->get('/categories', function(){
    global $db;
    $stmt = $db->prepare("SELECT * FROM category");
    $stmt->execute();
    echo raw_json_encode($stmt->fetchAll());
});

//Categories by id
$app->get('/categories/:id', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM category WHERE id = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

//Categories by parent
$app->get('/categories/parent/:id', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM category WHERE parent = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

/**
 * Users
 */

//Get all users
$app->get('/users', function(){
    global $db;
    $stmt = $db->prepare("SELECT * FROM users");
    $stmt->execute();
    echo raw_json_encode($stmt->fetchAll());
});


/**
 * Offers
 */


$app->get('/offers', function(){
    global $db, $app;
    $stmt = $db->prepare("SELECT * FROM offers");
    $stmt->execute();
    echo raw_json_encode($stmt->fetchAll());
    echo 'ñ';
});

$app->get('/offers/:id', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM offers WHERE id = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

$app->post('/offers/add', function(){

    global $db, $app;
    $stmt = $db->prepare("INSERT INTO offers (title, description, url_image) VALUES (?,?,?)");
    $stmt->execute([$_POST['title'], $_POST['description'], $_POST['url_image']]);
    $app->response(200);
    echo 'OK';
});

/**
 * Locals
 */
$app->get('/locals', function(){
    global $db;
    $stmt = $db->prepare("SELECT * FROM locals");
    $stmt->execute();
    echo raw_json_encode($stmt->fetchAll());
});

$app->get('/locals/:id', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM locals WHERE id = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

$app->get('/locals/:id/reviews', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM opinions WHERE local_id = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

$app->get('/locals/category/:id', function($id){
    global $db;
    $stmt = $db->prepare("SELECT * FROM locals WHERE category_id = ?");
    $stmt->execute([$id]);
    echo raw_json_encode($stmt->fetchAll());
});

$app->post('/locals/reviews/add', function(){
    global $db;
    $stmt = $db->prepare("INSERT INTO opinions (user_id, title, message, score, created_date, local_id) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$_POST['user_id'], $_POST['title'], $_POST['message'], $_POST['score'], time()]);
});

$app->delete('/locals/reviews/:id/delete', function($id){
    global $db;
    $stmt = $db->prepare("DELETE FROM opinions WHERE local_id = ?");
    $stmt->execute([$id]);
});

$app->put('/locals/reviews/:id/update', function($id){
    global $db, $app;
    $stmt = $db->prepare("UPDATE opinions SET title=?, message=?, score=? WHERE id = $id");
    $stmt->execute([$app->request->put("title"), $app->request->put("message"), $app->request->put("score")]);
});

$app->post('/locals/:id/report/add',function($id){
    global $db;
    $stmt = $db->prepare("INSERT INTO reports (user_id, type, local_id) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['user_id'], $_POST['type'], $id]);
});

$app->delete('/locals/:id/favorite/add',function($id){
    global $db;
    $stmt = $db->prepare("DELETE FROM fav_locals WHERE local_id=? AND user_id=?");
    $stmt->execute([$id,1]);
});

$app->post('/locals/:id/favorite/undo',function($id){
    global $db;
    $stmt = $db->prepare("INSERT INTO fav_locals (local_id, user_id, receive_notifications, receive_offers) VALUES (?, ?, ?, ?)");
    $stmt->execute([$id, $_POST['user_id'], $_POST['receive_notifications'], $_POST['receive_offers']]);
});



$app->run();