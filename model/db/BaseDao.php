<?php

/**
 * BaseDao Abstract Class - Provides database connection 
 * and abstract functions to be implemented by the child DAO classes
 */
 class BaseDao {
    private $db         = null;
    private static $_instance;
    const DB_SERVER     = "localhost";
    const DB_USER       = "root";
    const DB_PASSWORD   = "";
    const DB_NAME       = "CastleTours";
    
    
    
    
	public static function getInstance() {
		if(!self::$_instance) { 
			self::$_instance = new self();
		}
		return self::$_instance;
	}
    
    private  function __construct(){
        $dsn = 'mysql:dbname='.self::DB_NAME.';host='.self::DB_SERVER;
        

        try {
            $this->db = new PDO($dsn, self::DB_USER, self::DB_PASSWORD);
            $this->db->query("SET NAMES 'utf8'");
        } catch (PDOException $e) {
            throw new Exception('Connection failed: ' . $e->getMessage());
        }
        
    }
    
    private function __clone() { }


	public function getConnection() {

                    return $this->db;
	}
    
}
?>
