/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let getPostedContent = function () {
    let xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const trendingDiv = document.getElementById('trendingData');

            // Clear previous content
            trendingDiv.innerHTML = '';

            // Parse the response as JSON
            const responseData = JSON.parse(xhr.responseText);

            // Get the 'post' array from the response
            const posts = responseData.post;

            // Create the dynamic table
            const table = document.createElement('table');
            table.classList.add('table', 'table-bordered');

            // Create the table header
            const thead = document.createElement('thead');
            const headerRow = document.createElement('tr');
            const headers = ['#', 'Title_Name', 'Date_of_Write', 'Date_of_Update', 'View_Link'];

            headers.forEach((header) => {
                const th = document.createElement('th');
                th.setAttribute('scope', 'col');
                th.textContent = header;
                headerRow.appendChild(th);
            });

            thead.appendChild(headerRow);
            table.appendChild(thead);

            // Create the table body
            const tbody = document.createElement('tbody');

            // Loop through the array of posts
            posts.forEach((post, index) => {
                const row = document.createElement('tr');

                // Serial number cell
                const serialCell = document.createElement('td');
                serialCell.textContent = index + 1;
                row.appendChild(serialCell);

                headers.slice(1).forEach((header) => {
                    const cell = document.createElement('td');
                    const prop = header;

                    if (header === 'View_Link') {
                        const viewLinkBtn = document.createElement('button');
                        viewLinkBtn.type = 'button';
                        viewLinkBtn.classList.add('btn', 'btn-primary');
                        viewLinkBtn.dataset.bsToggle = 'modal';
                        viewLinkBtn.dataset.bsTarget = '#contentModal';
                        viewLinkBtn.id = `viewLinkBtn_${post['titleid']}`;
                        viewLinkBtn.textContent = 'View';

                        // Attach click event listener
                        viewLinkBtn.addEventListener('click', function () {
                            getContentDetail(post['titleid']);
                        });

                        cell.appendChild(viewLinkBtn);
                    } else {
                        cell.textContent = post[prop];
                    }

                    row.appendChild(cell);
                });

                // Append the row to the table body
                tbody.appendChild(row);
            });

            // Append the table body to the table
            table.appendChild(tbody);

            // Append the dynamic table to the trendingDiv
            trendingDiv.appendChild(table);
        }
    };

    xhr.open('POST', 'http://localhost:8080/olp/fc/?action=model&page=FetchPostedContent', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send();
};

// Call the getPostedContent function to fetch and display the recent data
getPostedContent();

let getContentDetail = function (titleid) {
    let xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status >= 200 && xhr.status < 300 || xhr.status === 304) {
                let jobj = JSON.parse(xhr.responseText);
                let contentshow = jobj.contentshow;

                // Do something with the fetched content data
                // For example, display it in the modal
                let contentDetail = document.getElementById('contentDetail');
                contentDetail.innerHTML = '';

                contentshow.forEach((content) => {
                    let p = document.createElement('p');
                    p.textContent = content.contentt;
                    contentDetail.appendChild(p);
                });

                // Trigger the modal display
                let modal = new bootstrap.Modal(document.getElementById('contentModal'));
                modal.show();
                
            } else {
                alert('Request unsuccessful');
            }
        }
    };

    xhr.open('GET', "http://localhost:8080/olp/fc/?action=model&page=ViewContent&titleid=" + titleid, true);
    xhr.send();
};