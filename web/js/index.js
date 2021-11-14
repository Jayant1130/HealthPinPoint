var url = "http://localhost:8084/HealthID-System";

var loader = 1;

function setLoader(f){
    loader = f;
}
function close_model(modelid){
    document.getElementById(modelid).style.display = "none";
}
function open_model(modelid){
    document.getElementById(modelid).style.display = "flex";
}
function Loader(){
    var lo = document.getElementById("loader")
    if(loader == 0){
        lo.style.display = "none";
    } 
    if(loader == 1){
        lo.style.display = "flex";
    } 
    
}

function alert(msg){
    document.getElementById("toasterdiv").style.display = "flex";
    document.getElementById("toastercon").innerHTML = msg;
    setTimeout(function(){ 
    document.getElementById("toastercon").innerHTML = "";
    document.getElementById("toasterdiv").style.display = "none";
    }, 2000);
    
}


function Filevalidation(fi, maxsize){
        // Check if any file is selected.
        if (fi.files.length > 0) {
            for ( i = 0; i <= fi.files.length - 1; i++) {
                var fsize = fi.files.item(i).size;
                var file = Math.round((fsize / 1024));
                // The size of the file.
                if (file >= maxsize) {
                    alert(
                      "File too Big, please select a file less than 500kb");
                      fi.value = null; 
                }  else {
                    fi.innerHTML = '<b>'
                    + file + '</b> KB';
                }
            }
        }
    }