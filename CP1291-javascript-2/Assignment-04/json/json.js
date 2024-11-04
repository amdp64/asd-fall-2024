document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("convert").addEventListener("click", convertToObject);    
})

function convertToObject() {
    const input = document.getElementById("fname").value;
    const obj = {}
    obj["firstName"] = input;
    console.log(obj);
}