//Channel ID

let cid = document.getElementById("cid").value;

let btnCreateEpisdoe = document.getElementById("btn_create_episode");
let fileInput = document.getElementById("epFile");
let description = document.getElementById("description");
let audioSource = document.getElementById("audio_source");
let epTtable = document.getElementById("table_body");
let form = document.getElementById("form_episode");

let epOffcanvas = document.getElementById("addep");
let bsOffcanvas = new window.bootstrap.Offcanvas(epOffcanvas);

window.onload = function () {

    load();

    //送充新增
    btnCreateEpisdoe.onclick = function () {

        let fileUrl;
        let files = fileInput.files[0];

        //新增音檔
        let formData = new FormData();
        formData.append('file', files);

        let xhr1 = new XMLHttpRequest();
        xhr1.open('POST', "/ipodcast/logged/files/episode/sound", false);
        xhr1.onreadystatechange = getFileUrl;
        xhr1.send(formData);

        //新增音檔回傳
        function getFileUrl() {
            if (xhr1.readyState === XMLHttpRequest.DONE) {
                let responseJson = JSON.parse(xhr1.responseText);
                if (xhr1.status === 200) {
                    fileUrl = responseJson['data']['file'];
                    createEp();

                }
            }
        }

        //送出新增表單
        function createEp() {
            let xhr2 = new XMLHttpRequest();
            let formData = new FormData(form)
            formData.append("epFile", fileUrl);
            let url = `/ipodcast/logged/podcaster/channel/${cid}/episode`;
            xhr2.open('POST', url, false);
            xhr2.onreadystatechange = createResult;
            xhr2.send(formData);

            //新增結果
            function createResult() {
                if (xhr2.readyState === XMLHttpRequest.DONE) {
                    let responseJson = JSON.parse(xhr2.responseText);
                    if (xhr2.status === 200) {
                        alert(responseJson['data']['episode']);
                        refresh();

                    } else {
                        if (xhr2.status === 400) {
                            invalid(responseJson);
                        }
                    };
                }

            }
        };
    };

    //Ep info
    $(document.body).on("click", "tr[data-href]", function () {
        window.location.href = this.dataset.href;
    });


}

function load(){

    findAll();
}


function refresh(){
  bsOffcanvas.hide();       
  form.reset();
  resetValid();
  load(); 
}


//reset valid
function resetValid(){
    let elements = document.querySelectorAll("form input");
    elements.forEach(function(element){
      if(element.classList.contains("is-invalid")){
        element.classList.remove("is-invalid");
      }
    })
  
  }

//搜尋全部ep
function findAll(){
    let container = $("#pagination-container");
    let url = `/ipodcast/logged/podcaster/channel/${cid}/episode`;
    container.pagination({
        dataSource: url,
        alias: {
            pageNumber: 'page',
            pageSize: 'size'
        },
        locator: 'data.elements',
        totalNumber: 30,
        pageSize: 10,
        totalNumberLocator: function (response) {
            return response.data.total;
        },
        callback: function (response, pagination) {
            displayTable(response);
        },
        className: 'paginationjs-big'
    });
}


//處理invalid
function invalid(responseJson) {
    let errors = responseJson['errors'];
    for (let name in errors) {
        document.getElementById(name).className += " is-invalid";
        document.getElementById(name + "_invalid_text").innerHTML = errors[name];
    }
};

//處理Table畫面

function displayTable(elements) {

    epTtable.innerHTML = "";
    for (let i = 0; i < elements.length; i++) {
        let element = elements[i];
        let row = createRowHtml(i + 1, element['title'], element['pubDate'], element['id']);
        epTtable.insertAdjacentHTML('beforeend', String(row));
    }

};

//table row html
function createRowHtml(num, title, pubDate, eid) {
    let cardHtml = `
        <tr data-href="/ipodcast/logged/podcaster/channel/${cid}/episode-info/${eid}">
            <th scope="row">${num}</th>
            <td>${title}</td>
            <td>${pubDate}</td>
        </tr>
      `;
    return cardHtml;
};

//預覽音檔
fileInput.onchange = function () {
    var rd = new FileReader();
    var files = this.files[0];
    rd.readAsDataURL(files);
    rd.onload = function (e) {
        audioSource.src =this.result;
        audio.load();
    }
}