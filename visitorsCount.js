let countMv = document.getElementById("countm");
let countmv = 0;
let k = "A visitor record details:";
function museumincrement(){
     countmv += 1;
     countMv.innerText = countmv;
     let input = document.getElementsByName('array[]');

      let txtname = document.getElementById("fullname");
      let txtage = document.getElementById("age");
      let txtgender = document.getElementById("gender");
      let txtmonth = document.getElementById("myMonth");
      let txttime = document.getElementById("mytime");

      localStorage.setItem("name",txtname.value);
      localStorage.setItem("age",txtage.value);
      localStorage.setItem("gender",txtgender.value);
      localStorage.setItem("month",txtmonth.value);
      localStorage.setItem("time",txttime.value);
      for (let i = 0; i < input.length; i++) {
        let a = input[i];
        k = k + a.value + " ";
    }

  

}

let wellcomeVm =  document.getElementById("wellcomev");
//let nameW = "chijioke ogbonna";
let wellcomeMv = " wellcome to Museum Visitors Record WebApplication "
 function wellcomepage(){
       let pageName = wellcomeMv;
       wellcomeVm.innerText = pageName;
 }

 wellcomepage();

let saveMv = document.getElementById("save-mv");
let saveMb = document.getElementById("save-btn");

function museumsave() {
 let countstrv = countmv + "-" ;
 saveMv.textContent += countstrv;
 countMv.innerText = 0;
 countmv = 0;
 console.log(countmv);
}
let txtinputMonth = document.getElementById("myMonth");
let month= document.getElementById("month1");
 let monthInput = saveMb.addEventListener('click',function musmonth(){
    const months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    let dataM = txtinputMonth.value;
    const d = new Date(dataM);
    let month = months[d.getMonth()];
    document.getElementById("month1").innerText = month;
})
 
  let day = document.getElementById("month2");

let dayInput = saveMb.addEventListener('click',function musday(){
    const days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    let dataD = txtinputMonth.value;
    const d = new Date(dataD);
    let day = days[d.getDay()];
    document.getElementById("month2").innerText = day;
})

//code for saving input data to localstorage or sessionstorage

let displayInput = saveMb.addEventListener('click',function select(){
  var y =localStorage.getItem("name");
 document.getElementById("demo1").value = y;
 var x =localStorage.getItem("age");
 document.getElementById("demo2").value = x;  
 var p =localStorage.getItem("gender");
 document.getElementById("demo3").value = p;
 var z =localStorage.getItem("month");
 document.getElementById("demo4").value = z;     
 var d =localStorage.getItem("time");
 document.getElementById("demo5").value = d;  
   })

   // function code for table records
   function addRecord() {
    "use strict";
      
      var tableBody = document.getElementById("table-body");
      var td1 = document.createElement("td");
      var td2 = document.createElement("td");
      var td3 = document.createElement("td"); 
      var td4 = document.createElement("td");
      var td5 = document.createElement("td");   
      var row = document.createElement("tr");
      
      td1.innerHTML = document.getElementById("demo1").value;
      td2.innerHTML  = document.getElementById("demo2").value;
      td3.innerHTML  = document.getElementById("demo3").value;
      td4.innerHTML  = document.getElementById("demo4").value;
      td5.innerHTML  = document.getElementById("demo5").value;
      
      row.appendChild(td1);
      row.appendChild(td2);
      row.appendChild(td3);
      row.appendChild(td4);
      row.appendChild(td5);
    
      
      tableBody.appendChild(row);
      }
  