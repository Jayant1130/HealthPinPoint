function getHIForDoctor(HealthID) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/getHIForDoctor.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthID="+HealthID ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        document.getElementById("HIForDoctor").innerHTML = r;
        console.log(r);
    setLoader(0);
   }
}