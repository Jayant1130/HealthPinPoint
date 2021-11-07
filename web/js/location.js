function getCitiesByStateID(stateid) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/ajax/getCitiesByStateID.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "StateID="+stateid ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        document.getElementById("city").innerHTML = r;
        console.log(r);
    setLoader(0);
   }
}