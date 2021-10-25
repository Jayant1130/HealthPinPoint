function isAadharExist(aadhar) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   "http://localhost:8084/HealthID-System/ajax/isAadharExist.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "aadhar="+aadhar ;
    http.send(params);
    http.onload = function () 
   {
        var r = (http.responseText).toString().trim();
        if(r=="true")
        {
            alert("aadhar exist");
          
        }
        else
            alert("valid aadhar");
   }
}


