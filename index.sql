-- 1- Create a simple stored procedure named add() that returns the product of two integers using plpgsql.
CREATE OR REPLACE FUNCTION multiply(a integer, b integer)
  RETURNS integer AS $$
BEGIN
  RETURN a * b;
END;
$$ LANGUAGE plpgsql;

-- 2- Connect to the PostgreSQL database server by creating a new instance of the PDO class.
$host = 'localhost';
$dbname = 'bootcamp';
$user = 'postgres';
$password = '1234';
$dsn = "pgsql:host=$host;dbname=$dbname;user=$user;password=$password";
$pdo = new PDO($dsn);

-- 3- Prepare the statement that calls the stored procedure for execution using the prepare() method of the PDO object. 
---The prepare() method returns a PDOStatement object.
$sql = "SELECT multiply(:a, :b)";
$stmt = $pdo->prepare($sql);

-- 4- Optionally pass values to the statement using the bindValue() method.
$stmt->bindValue(':a', 5, PDO::PARAM_INT);
$stmt->bindValue(':b', 7, PDO::PARAM_INT);

--5-Execute the statement using the execute() method of the PDOStatement object.

You can pass the values to the statement when calling the execute() method as well.
Get the value using the fetchColumn() method that returns a single column of the next row in the result set.
$stmt->execute();
$result = $stmt->fetchColumn();
echo $result; // Output: 35
