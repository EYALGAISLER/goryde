<!--#INCLUDE FILE="database.asp"-->
<!--#INCLUDE FILE="connection.asp"-->
<!--#INCLUDE FILE="javascript.js"-->

<%
ticket_status = Request.Form("ticket_status")
ticket_priority = Request.Form("ticket_priority")
ticket_group = Request.Form("ticket_group")

ls_sql = "select * from gordye_ticket_groups"
set lo_rs_gordye_ticket_groups = lo_con.execute(ls_sql)

ls_sql = "select * from gordye_ticket_priority"
set lo_rs_gordye_ticket_priority = lo_con.execute(ls_sql)

ls_sql = "select top 3000 * from gordye_tickets,gordye_ticket_groups,gordye_ticket_priority"
ls_sql = ls_sql &" where gordye_tickets.ticket_group_id = gordye_ticket_groups.group_id and gordye_tickets.ticket_priority = gordye_ticket_priority.ticket_priority_id"

if ticket_status <> "" then
	ls_sql = ls_sql &"  and gordye_tickets.ticket_status = "&ticket_status
end if

if ticket_priority <> "" then
	ls_sql = ls_sql &"  and gordye_tickets.ticket_priority = "&ticket_priority
end if

if ticket_group <> "" then
	ls_sql = ls_sql &"  and gordye_tickets.ticket_group_id = "&ticket_group
end if

ls_sql = ls_sql &"  order by gordye_tickets.ticket_date"
'ls_sql = ls_sql &"  order by gordye_tickets.ticket_id"
'response.write(ls_sql)

set lo_rs_gordye_tickets = lo_con.execute(ls_sql)

%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<!--#INCLUDE FILE="style.css"-->
    <title>Gordye Ticket System</title>
  </head>
  <body>
  <div class="sitebox">
  <center><h1>Gordye Ticket System</h1></center>
  <div class="searchbox">
  <form action="index.asp" method="post">
  <label class="form-label">Ticket Status:</label>
  <select name="ticket_status"  id="ticket_status" class="form-select" aria-label="Ticket Status">
  <option value="">Open this select menu</option>
  <%if ticket_status<> "" then%>
  	<option value="0" <%if ticket_status = 0 then%>selected<%end if%>>Open</option>
  	<option value="1" <%if ticket_status = 1 then%>selected<%end if%>>Closed</option>
	<%else%>
  	<option value="0">Open</option>
  	<option value="1">Closed</option>
	<%end if%>
  </select>

  <label class="form-label">Ticket Priority:</label>
  <select name="ticket_priority" id="ticket_priority" class="form-select" aria-label="Ticket Group">
    <option value="">Open this select menu</option>
    <%do while not lo_rs_gordye_ticket_priority.eof%>
      <%if ticket_priority <> "" then%>
	  <option value="<%response.write(lo_rs_gordye_ticket_priority("ticket_priority_id"))%>" <%if int(ticket_priority) =  int(lo_rs_gordye_ticket_priority("ticket_priority_id")) then%>selected<%end if%>><%response.write(lo_rs_gordye_ticket_priority("ticket_priority_name"))%></option>
	  <%else%>
	  <option value="<%response.write(lo_rs_gordye_ticket_priority("ticket_priority_id"))%>"><%response.write(lo_rs_gordye_ticket_priority("ticket_priority_name"))%></option>
	  <%end if%>
    <%lo_rs_gordye_ticket_priority.movenext%>
    <%loop%>
  </select>

  <label class="form-label">Ticket Group:</label>
  <select name="ticket_group" id="ticket_group" class="form-select" aria-label="Ticket Group">
    <option value="">Open this select menu</option>
    <%do while not lo_rs_gordye_ticket_groups.eof%>
	<%if ticket_group <> "" then%>
      <option value="<%response.write(lo_rs_gordye_ticket_groups("group_id"))%>" <%if int(ticket_group) =  int(lo_rs_gordye_ticket_groups("group_id")) then%>selected<%end if%>><%response.write(lo_rs_gordye_ticket_groups("group_name"))%></option>
	  <%else%>
	  <option value="<%response.write(lo_rs_gordye_ticket_groups("group_id"))%>"><%response.write(lo_rs_gordye_ticket_groups("group_name"))%></option>
	  <%end if%>
    <%lo_rs_gordye_ticket_groups.movenext%>
    <%loop%>
  </select>
  <div class="col-12">
    <button class="btn btn-primary" type="submit">Search</button>
  </div>
  </form>
  </div>
  <hr>
  <table class="table">
    <tr>
    <%
      gordye_tickets_fields_number = lo_rs_gordye_tickets.Fields.Count
      gordye_tickets_fields_number = gordye_tickets_fields_number-1
      for i=0 to gordye_tickets_fields_number
    %>
        <td><%=lo_rs_gordye_tickets.Fields(i).Name%></td>
    <%
      next
    %>
    </tr>
	<%counter=0%>
    <%do while not lo_rs_gordye_tickets.eof%>
		<div class="divrow" id="rownum<%=counter%>">
    		<tr <%if counter >=25 then%>class="hide" id="tr_hide<%=counter%>" name="tr_hide<%=counter%>"<%else%>id="tr_show<%=counter%>" name="tr_show<%=counter%>"<%end if%>>
      			<%for i=0 to gordye_tickets_fields_number%>
        			<td class="td-color"><%=lo_rs_gordye_tickets.Fields(i).Value%></td>
      			<%next%>
    		</tr>
		</div>
    	<%lo_rs_gordye_tickets.movenext%>
		<%counter = counter+1%>
    <%loop%>
  </table>
  <input type="button" value="show next 25 results" onmouseover="show_hidden(<%=counter%>)" onClick="show_hidden(<%=counter%>)">
  <input type="hidden" name="row_counter " id="row_counter" value="25">
  </div>
  </body>
</html>
