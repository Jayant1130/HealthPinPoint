function isAadharExist() 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   "https:/localhost:3304/healthID-system/ajax/isAadharExist.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "aadhar="+aadhar ;
    http.send(params);
    setProbar(0);
    http.onload = function () 
   {
        var r = (http.responseText).toString().trim();
        setProbar(1);
   }
}


