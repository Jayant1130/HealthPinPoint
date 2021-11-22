var  aadharf = 0;
function isAadharExist(aadhar) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/ajax/isAadharExist.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "aadhar="+aadhar ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        if(r.localeCompare("true") == 0)
        {
           aadharf = 0;
        }else{
        
            aadharf = 1;
        }
    setLoader(0);
   }
}

function isAadharExist1(aadhar) 
{
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST",   url+"/ajax/isAadharExist.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "aadhar="+aadhar ;
    console.log(aadhar);
    http.send(params);
    http.onload = function () 
   {    
        var r = (http.responseText).toString().trim();
        console.log(r)
        if(r.localeCompare("true") == 0)
        {
           aadharf = 0;
           alert("aassd")
        }else{
        
            aadharf = 1;
           alert("aassd111")
        }
   }
}
function aadharsubmit(){
    var aadhar =  ""+document.getElementById("aadhar").value;
    var password =  ""+document.getElementById("password").value;
    var confirmpassword =  ""+document.getElementById("confirmpassword").value;
    isAadharExist(aadhar);
    if(password.localeCompare(confirmpassword) == 0 && aadharf == 1){
        return true;
    }else if(aadharf == 0){
        alert("Given Aadhar card already exist!!");
        return false;
    }else{
        alert("Password and confirm password must be same !!");
        return false;
    }
}


var sendOTP = 0;
var ChOTP = 0;


function bhejOTP(Name, Email, Mobile) 
{
    var http = new XMLHttpRequest();
    var mail = document.getElementById("Email");
    http.open("POST",   url+"/ajax/sendOTP.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "Name="+Name+"&Email="+Email+"&Mobile="+Mobile ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        if(r.localeCompare("true") == 0)
        {
           sendOTP = 1;
           alert("Your one time password send via Email and SMS!!");
           
        }else{
            
        document.getElementById("verifymebutton").style.display = "flex";
        document.getElementById("OTP").required = false;
        document.getElementById("otpfield").style.display = "none";
        document.getElementById("createidbutton").style.display = "none";
           alert("Unable to process for one time password!!");
            sendOTP = 0;
        }
           setLoader(0);
    }
}

function checkOTP(Name, Email, Mobile, OTP) 
{
    var http = new XMLHttpRequest();
    var mail = document.getElementById("Email");
    http.open("POST",   url+"/ajax/checkOTP.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "OTP="+OTP + "&Email="+Email+"&Mobile="+Mobile  ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        if(r.localeCompare("true") == 0)
        {
           ChOTP = 1;
           alert("Validation Completed. We are proceding to create your Health PinPoint Accunt !")
        }else{
            ChOTP = 0;
           alert("Incorrect OTP. Try again!")
        }
    setLoader(0);
    }
}

 function CreateId(Name, Email, Mobile, OTP) 
{  
   
    if(sendOTP == 0){
        document.getElementById("verifymebutton").style.display = "none";
        document.getElementById("OTP").required = true;
        document.getElementById("otpfield").style.display = "flex";
        document.getElementById("createidbutton").style.display = "flex";
        bhejOTP(Name, Email, Mobile);
    return false;
    }else if(sendOTP == 1){
        checkOTP(Name, Email, Mobile, OTP)
        if(ChOTP == 1){
            return true;
        }else{
            return false;
        }
    }
    
}

function CreateHospitalId(Name, Email, OTP) 
{  
    if(sendOTP == 0){
        document.getElementById("verifymebutton").style.display = "none";
        document.getElementById("OTP").required = true;
        document.getElementById("otpfield").style.display = "flex";
        document.getElementById("createidbutton").style.display = "flex";
        bhejHospitalOTP(Name, Email);
    return false;
    }else if(sendOTP == 1){
        checkHospitalOTP(Name, Email, OTP)
        if(ChOTP == 1){
            return true;
        }else{
            return false;
        }
    }
    
}

function bhejHospitalOTP(Name, Email) 
{
    var http = new XMLHttpRequest();
    var mail = document.getElementById("Email");
    http.open("POST",   url+"/ajax/sendHospitalOTP.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "Name="+Name+"&Email="+Email ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        if(r.localeCompare("true") == 0)
        {
           sendOTP = 1;
           alert("Your one time password send via Email and SMS!!");
           
        }else{
            
        document.getElementById("verifymebutton").style.display = "flex";
        document.getElementById("OTP").required = false;
        document.getElementById("otpfield").style.display = "none";
        document.getElementById("createidbutton").style.display = "none";
           alert("Unable to process for one time password!!");
            sendOTP = 0;
        }
           setLoader(0);
    }
}

function checkHospitalOTP(Name, Email,  OTP) 
{
    var http = new XMLHttpRequest();
    var mail = document.getElementById("Email");
    http.open("POST",   url+"/ajax/checkHospitalOTP.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "OTP="+OTP + "&Email="+Email  ;
    http.send(params);
    setLoader(1);
    http.onload = function () 
    {    
        var r = (http.responseText).toString().trim();
        if(r.localeCompare("true") == 0)
        {
           ChOTP = 1;
           alert("Validation Completed. We are proceding to create your Health PinPoint Accunt !")
        }else{
            ChOTP = 0;
           alert("Incorrect OTP. Try again!")
        }
    setLoader(0);
    }
}