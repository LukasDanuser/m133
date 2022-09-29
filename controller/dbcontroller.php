<?php
class DBController
{
	private $host = "localhost";
	private $user = "root";
	private $password = "";
	private $database = "db1";
	private $conn;

	function __construct()
	{
		$this->conn = $this->connectDB();
	}

	function connectDB()
	{
		$conn = mysqli_connect($this->host, $this->user, $this->password, $this->database);
		return $conn;
	}

	function insertQuery($query)
	{
		$conn = new mysqli($this->host, $this->user, $this->password, $this->database);
		// Check connection
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}

		if ($conn->query($query) === TRUE) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $query . "<br>" . $conn->error;
		}

		$conn->close();
	}

	function deleteQuery($query)
	{
		mysqli_query($this->conn, $query);
	}

	function runQuery($query)
	{
		$result = mysqli_query($this->conn, $query);
		while ($row = mysqli_fetch_assoc($result)) {
			$resultset[] = $row;
		}
		if (!empty($resultset))
			return $resultset;
	}

	function numRows($query)
	{
		$result  = mysqli_query($this->conn, $query);
		$rowcount = mysqli_num_rows($result);
		return $rowcount;
	}
}
