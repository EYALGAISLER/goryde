<!--#INCLUDE FILE="database.asp"-->
<!--#INCLUDE FILE="connection.asp"-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

ls_sql = "select * from gordye_tickets"
set lo_rs = lo_con.execute(ls_sql)
