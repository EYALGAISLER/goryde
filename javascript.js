<script language="JavaScript">
function show_hidden(counter)
	{
		var row_counter;
		row_counter = parseInt(document.getElementById("row_counter").value);
		for (let i = row_counter; i < (row_counter+25); i++)
		{
			var row_name = "tr_hide";
			row_name = row_name.concat(i);
			var element = document.getElementById(row_name);
  			element.classList.remove("hide");
		}
		row_counter = row_counter+25
		document.getElementById("row_counter").value = row_counter;
	}
	
window.onscroll = function(ev) {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		var row_counter2;
		row_counter2 = parseInt(document.getElementById("row_counter").value);
		show_hidden(row_counter2)
    }
};

</script>