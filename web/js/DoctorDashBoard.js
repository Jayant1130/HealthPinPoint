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
        alert('getting updated Health Issue');
        document.getElementById("HIForDoctor").innerHTML = r;
    setLoader(0);
   }
}

function addNewHealthIssue(form, HealthID) 
{   
    var input=form.elements;
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/_addNewHealthIssue.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthID="+HealthID+"&" ;
    for(var i = 0 ; i < input.length ; i++ ){
        params= params+input[i].name + "="+ input[i].value+"&";
    }
    console.log(params);
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        alert(r);
        getHIForDoctor(HealthID);
        console.log(r);
        
    }
}

function getUpdateHealthModel(HealthIssueID) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/getUpdateHealthIssueModel.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthIssueID="+HealthIssueID ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        document.getElementById("updatehealthissue").innerHTML = r;
    setLoader(0);
   }
}

function updateHealthIssue(form, HealthID) 
{   
    var input=form.elements;
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/_updateHealthIssue.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthID="+HealthID+"&" ;
    for(var i = 0 ; i < input.length ; i++ ){
        params= params+input[i].name + "="+ input[i].value+"&";
    }
    console.log(params);
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        alert(r);
        getHIForDoctor(HealthID);
        document.getElementById("updatehealthissue").style.display = "none";
        console.log(r);
        
    };
}

function getTreatments(Model, HealthIssueID) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/getTreatments.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthIssueID="+HealthIssueID ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        alert('getting updated Treatement');
        Model.innerHTML = r;
        setLoader(0);
   };
}

function addTreatment(form, HealthID, Model, HealthIssueID) 
{   
    var input=form.elements;
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/Doctor/ajax/_addTreatment.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "HealthID="+HealthID+"&" ;
    for(var i = 0 ; i < input.length ; i++ ){
        params= params+input[i].name + "="+ input[i].value+"&";
    }
    console.log(params);
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        alert(r);
        getHIForDoctor(HealthID);
        getTreatments(Model, HealthIssueID);
        console.log(r);
        
    }
}