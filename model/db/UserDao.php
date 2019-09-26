<?php

require_once 'BaseDao.php';

class UserDao
{

    private $db;
    private $_Conn;

    public function __construct()
    {
    }


    public function Delete($_Tablename, $_ColNameID)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $_SQL = 'DELETE FROM ' . $_Tablename . ' WHERE id=:_id';
        $_Statment = $_Conn->prepare($_SQL);
        $_Statment->bindParam(':_id', $_ColNameID);
        $_Statment->execute();
    }


    public function insert($TableName, array $values)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $sql = 'INSERT INTO ' . $TableName;
        $fields = array_keys($values);
        $vals = array_values($values);

        $sql .= '(' . implode(',', $fields) . ') ';

        $arr = array();
        foreach ($fields as $f) {
            $arr[] = '?';
        }
        $sql .= 'VALUES (' . implode(',', $arr) . ') ';

        $statement = $_Conn->prepare($sql);
        foreach ($vals as $i => $v) {
            $statement->bindValue($i + 1, $v);
        }

        return $statement->execute();
    }


    public function SelectAll($_TableName, $_ColName)
    {

        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $_SQL = 'SELECT * FROM ' . $_TableName . ' ORDER BY ' . $_ColName . ' ASC';
        $_Statment = $_Conn->prepare($_SQL);
        $_Statment->execute();
        $_Result = array();
        $i = 0;
        while ($_Row = $_Statment->fetch()) {
            $_Result[$i] = $_Row;
            $i++;
        }
        return $_Result;
    }

    public function SelectAllWhere($_TableName, $_ColName, $_Condition)
    {

        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $_SQL = 'SELECT * FROM ' . $_TableName . ' WHERE ' . $_Condition . ' ORDER BY ' . $_ColName . ' ASC';
        $_Statment = $_Conn->prepare($_SQL);
        $_Statment->execute();
        $_Result = array();
        $i = 0;
        while ($_Row = $_Statment->fetch()) {
            $_Result[$i] = $_Row;
            $i++;
        }
        return $_Result;
    }

    public function update($_TableName, $id, array $values)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $sql = 'UPDATE' . $_TableName . 'SET ';
        $fields = array_keys($values);
        $vals = array_values($values);

        foreach ($fields as $i => $f) {
            $fields[$i] .= ' = ? ';
        }

        $sql .= implode(',', $fields);

        $statement = $_Conn->prepare($sql);
        foreach ($vals as $i => $v) {
            $statement->bindValue($i + 1, $v);
        }
        $sql .= ' WHERE id =:_id';

        $statement->bindParam(':_id', $id);

        $statement->execute();
    }

    public function SelectUserData($_Uname, $_Password)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $_SQL = 'SELECT * FROM mobile_numbers,user  WHERE mobile_numbers.mobileNumber=:_Uname AND mobile_numbers.id = user.mobileId AND user.password=:_Password';
        $_Statment = $_Conn->prepare($_SQL);
        $_Statment->bindParam(':_Uname', $_Uname);
        $_Statment->bindParam(':_Password', $_Password);
        $_Statment->execute();
        $Data = $_Statment->fetch();
        return $Data;
    }

    public function SelectUsername($_ID)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();
        $_SQL = 'SELECT name FROM user WHERE id=:_ID ';
        $_Statment = $_Conn->prepare($_SQL);
        $_Statment->bindParam(':_ID', $_ID);
        $_Statment->execute();
        $Data = $_Statment->fetch();
        return $Data;
    }

    public function Select($_TableName, $_Values)
    {

        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();


        $sql = 'SELECT * FROM ' . $_TableName . ' WHERE id=:_Values';
        $_Values = (int)$_Values;
        $_Statement = $_Conn->prepare($sql);
        $_Statement->bindParam(':_Values', $_Values);
        $_Statement->execute();
        $_Answe = $_Statement->fetch();

        return $_Answe;
    }

    public function SelectMaxID($_TableName)
    {
        $db = BaseDao::getInstance();
        $_Conn = $db->getConnection();

        $_SQL = 'SELECT MAX(ID) FROM ' . $_TableName;
        $_Statement = $_Conn->prepare($_SQL);
        $_Statement->execute();
        $_MaxID = $_Statement->fetch();
        return $_MaxID[0];
    }


}

?>
