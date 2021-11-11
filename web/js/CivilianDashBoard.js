function getRequestModel() 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Civilian/ajax/getRequestModel.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "" ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        document.getElementById("EntreatyScreen").innerHTML = r;
        console.log(r);
    setLoader(0);
   }
}

function updateFamilyMemberStatus(HealthID,Status) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Civilian/ajax/_updateFamilyMemberStatus.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "aadhar="+HealthID+"&status="+Status ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        alert(r);
        getRequestModel();
        
        console.log(r);
   
   }
}