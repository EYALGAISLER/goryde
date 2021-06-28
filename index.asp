<!--#INCLUDE FILE="includes/database.asp"-->
<!--#INCLUDE FILE="includes/connection.asp"-->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

ls_sql = "select * from gordye_tickets"
set lo_rs = lo_con.execute(ls_sql)
