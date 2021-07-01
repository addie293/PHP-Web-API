<?php

    require_once("config.php");

    // for response in json
    function response($status_code = 200){
        global $response;
        echo json_encode($response);die();
    }

    $response = [
        "nodes" => [],
    ];

    // Checking method is GET or not
    if($_SERVER['REQUEST_METHOD'] != "GET"){
        $response['error'] = "Method not allowed";
        response();
    }

    // Checking node_id is given or not
    if(!isset($_GET['node_id'])){
        $response['error'] = "Invalid node id";
        response();
    }

    // Checking language is given or not
    if(!isset($_GET['language'])){
        $response['error'] = "Missing mandatory params";
        response();
    }

    // Assigning given parameters 
    $idNode = $_GET['node_id'];
    $language = $_GET['language'];
    $search_keyword = $_GET['search_keyword']??"";
    $page_num = $_GET['page_num']??0;
    $page_size = $_GET['page_size']??100;

    // Checking page number is valid or not
    if($page_num < 0){
        $response['error'] = "Invalid page number requested";
        response();
    }

    // Checking page size is valid or not
    if($page_size < 1){
        $response['error'] = "Invalid page size requested";
        response();
    }

    // Calculating total records wants to skip
    $skip = $page_num * $page_size;

    $nodes = [];
    
    // sub query for getting nodes of searched field
    $sub_query_ileft = "SELECT nt.iLeft from node_tree nt WHERE nt.idNode = '{$idNode}'";
    
    // sub query for nodeName
    $sub_query_name = "SELECT `names`.`nodeName` FROM `node_tree_names` `names`
        WHERE `Child`.`idNode` = `names`.`idNode` AND `names`.`language` = '{$language}' LIMIT 1";

    // sub query for child node count
    $sub_query_child_count = "SELECT COUNT(*) FROM node_tree
        WHERE node_tree.iLeft > Child.iLeft AND node_tree.iRight < Child.iRight AND node_tree.level = Child.level + 1";

    // Query According to Nested set model
    $query = "SELECT DISTINCT `Child`.`idNode` as `node_id`, ({$sub_query_name}) AS `name`,
        ({$sub_query_child_count}) AS `children_count`
        FROM `node_tree` AS `Child`, `node_tree` AS `Parent` 
        WHERE Parent.iLeft < `Child`.`iLeft` AND Parent.iRight > `Child`.`iRight`
        AND `Child`.`level` = Parent.level + 1
        GROUP BY `Child`.`level`, `Child`.`iLeft`, `Child`.`iRight`
        HAVING MAX(Parent.iLeft) >= ($sub_query_ileft) AND `name` LIKE '%{$search_keyword}%'
        ORDER BY `Child`.`level`, `Child`.`iLeft`, `Child`.`iRight`    
        LIMIT {$skip}, {$page_size}";
    // executing query
    $result = $con->query($query);
    
    // looping database records
    while($record = $result->fetch_assoc()){
        $nodes[] = $record;
    }

    $response['nodes'] = $nodes;
    response();

?>