var url = "http://localhost:8084/HealthID-System";

var loader = 1;

function setLoader(f){
    loader = f;
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



