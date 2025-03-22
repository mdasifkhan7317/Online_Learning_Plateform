/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let fieldValidator=function(a,b){
   let x= document.getElementById(a);
   let y= document.getElementById(b);
   if(x.value ===""){
       y.innerHTML="Field should not be empty";
   }else{
       y.innerHTML="";
   }
};   
let getcountries = function () {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange=function() {
        if (xhr.readyState===4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                //alert(xhr.responseText);
                let jobj =JSON.parse(xhr.responseText);
                for (x in jobj.countries) {
                    let a = document.createElement("option");
                    a.appendChild(document.createTextNode(jobj.countries[x]));
                    a.setAttribute("value", x);
                    let elm = document.getElementById("con");
                    elm.appendChild(a);
                }
            } else {
                alert("Request Unsucessful");
            }
        }
    };
    xhr.open("get","http://localhost:8080/olp/fc/?action=model&page=countryselect", true);
    xhr.send(null);
};
let contentprovider = function () {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
                let jobj = JSON.parse(xhr.responseText);
                for (x in jobj.user) {
                    let a = document.createElement("option");
                    a.appendChild(document.createTextNode(jobj.user[x]));
                    a.setAttribute("value", x);
                    let elm = document.getElementById("type");
                    elm.appendChild(a);
                }
            } else {
                alert("Request Unsucessful");
            }
        }
    };
    xhr.open("get", "http://localhost:8080/olp/fc/?action=model&page=selectprovider", true);
    xhr.send(null);
}
let catSelector =function(){
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange=function() {
        if (xhr.readyState===4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                //alert(xhr.responseText);
                let jobj =JSON.parse(xhr.responseText);
                for (x in jobj.category) {
                    let a = document.createElement("option");
                    a.appendChild(document.createTextNode(jobj.category[x]));
                    a.setAttribute("value", x);
                    let elm = document.getElementById("cat");
                    elm.appendChild(a);
                }
            } else {
                alert("Request Unsucessful");
            }
        }
    };
    xhr.open("get", "http://localhost:8080/olp/fc/?action=model&page=getcategory", true);
    xhr.send(null);
}
let getSubCategory = function (categoryId) {
    let xhr = new XMLHttpRequest();
    let dropdown = document.getElementById(categoryId).value;
    
    //console.log(elm+"............");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
               //alert(xhr.responseText);
                let jobj = JSON.parse(xhr.responseText);
              // alert(jobj.subcategory);
                for (x in jobj.subcategory) {
                 // alert(x);
                    let a = document.createElement("option");
                    a.appendChild(document.createTextNode(jobj.subcategory[x]));
                    a.setAttribute("value", x);
                    
                   let elm = document.getElementById("subcat");
                    //console.log(elm+"........");
                    elm.appendChild(a);
                }

            } else {
                alert("Request unsuccessful");
            }
        }
    };
    xhr.open("get","http://localhost:8080/olp/fc/?action=model&page=getsubcategorymodel&elm="+dropdown, true);
    xhr.send(null);
};
let getTopic=function(SubCatId){
    let xhr=new XMLHttpRequest();
    let dropdown =document.getElementById(SubCatId).value;
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4){
            if((xhr.status>=200 && xhr.status<300)||xhr.status===304){
                let jobj=JSON.parse(xhr.responseText);
                for(x in jobj.topic){
                    let a=document.createElement("option");
                    a.appendChild(document.createTextNode(jobj.topic[x]));
                    a.setAttribute("value",x);
                    let elm=document.getElementById("top");
                    elm.appendChild(a);
                }
                
            }else{
                alert("Request unsuccessful");
            }
        }
    };

    xhr.open("get", "http://localhost:8080/olp/fc/?action=model&page=topicselectormodel&topicid=" +dropdown, true);
    xhr.send(null);
};
//let getcontents = function () {
//    let xhr = new XMLHttpRequest();
//    xhr.onreadystatechange = function () {
//        if (xhr.readyState === 4) {
//            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
//                alert(xhr.responseText);
//                let jobj = JSON.parse(xhr.responseText);
//                //alert(jobj.countries);
//                for (x in jobj.Post) {
//                    //alert(x);
//                    let a = document.createElement("option");
//                    a.appendChild(document.createTextNode(jobj.Post[x]));
//                    a.setAttribute("value", x);
//                    let elm = document.getElementById("contentp");
//                    elm.appendChild(a);
//                }
//
//            } else {
//                alert("Request unsuccessful");
//            }
//        }
//    };
//    xhr.open("get", "http://localhost:8080/olp/fc/?action=model&page=ContentLinkModel", true);
//    xhr.send(null);
//};

let getcontent = function () {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 304) {
                let jobj = JSON.parse(xhr.responseText);
                let posts = jobj.Post;
                let tableBody = document.getElementById('table-body');

                posts.forEach(function (post) {
                    let row = document.createElement('tr');

                    let serialNumberCell = document.createElement('td');
                    serialNumberCell.textContent = post.content_id;
                    row.appendChild(serialNumberCell);

                    let titleCell = document.createElement('td');
                    titleCell.textContent = post.title;
                    row.appendChild(titleCell);

                    let dateOfWritingCell = document.createElement('td');
                    dateOfWritingCell.textContent = post.dou;
                    row.appendChild(dateOfWritingCell);

                    let lastUpdatedCell = document.createElement('td');
                    lastUpdatedCell.textContent = post.dow;
                    row.appendChild(lastUpdatedCell);

                    let statusCell = document.createElement('td');
                    statusCell.textContent = post.status;
                    row.appendChild(statusCell);

//                    let contentCell = document.createElement('td');
//                    contentCell.textContent = post.content;
//                    row.appendChild(contentCell);

//                    let contentCell = document.createElement('td');
//                    let viewLink = document.createElement('a');
//                    viewLink.href = "http://localhost:8080/olp/fc/?action=model&page=ContentLinkModel?contentId=" + post.content_id; // Set the URL for view content page
//                    viewLink.textContent = "View";
//                    contentCell.appendChild(viewLink);
//                    row.appendChild(contentCell);

                    let contentCell = document.createElement('td');
                    let viewLink = document.createElement('a');
                    viewLink.href = 'http://localhost:8080/olp/fc/?action=model&page=ContentLinkModel?contentId=' + post.content_id; // Set the URL for view content page
                    viewLink.textContent = 'View';
                    viewLink.addEventListener('click', function (e) {
                        e.preventDefault(); // Prevent the default behavior of the link
                        showModal(post.content_id); // Pass the content ID to the showModal function
                    });
                    contentCell.appendChild(viewLink);
                    row.appendChild(contentCell);

                    tableBody.appendChild(row);
                });
            } else {
                alert("Request unsuccessful");
            }
        }
    };
    xhr.open("get", "http://localhost:8080/olp/fc/?action=model&page=ContentLinkModel", true);
    xhr.send(null);
};

function showModal(contentId) {
    let modal = document.getElementById('myModal');
    // Update the modal content based on the content ID
    // Example: You can use Ajax to fetch the content and update the modal dynamically

    let modalBody = modal.querySelector('.modal-body');

    // Make an AJAX request to fetch the content based on the contentId
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status >= 200 && xhr.status < 300) {
                //alert(xhr.responseText);
                // Update the modal body with the fetched content
                modalBody.textContent = xhr.responseText;
                modal.style.display = 'block';
            } else {
                console.error('Error fetching content:', xhr.status);
            }
        }
    };

    // Construct the URL for fetching the content based on the contentId
    let url = 'http://localhost:8080/olp/fc/?action=model&page=ContentLinkModel?contentId=' + contentId;

    // Open and send the AJAX request
    xhr.open('GET', url, true);
    xhr.send();
    modal.style.display = 'block';
}

// Call the getContent function to fetch and display the content