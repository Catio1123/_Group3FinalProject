let btnCreateChannel = document.getElementById("btn_create_channel");
let fileInput = document.getElementById("input_channel_img");
let categoriesSelect = document.getElementById("category");
let cardContainer = document.getElementById("cards_container");
let channelOffcanvas = document.getElementById("addchannel");
let bsOffcanvas = new window.bootstrap.Offcanvas(channelOffcanvas);
let form = document.getElementById("form_channel");

window.onload = function () {

  load();
  

  //預覽圖片
  fileInput.onchange = function () {
    var rd = new FileReader();
    var files = this.files[0];
    rd.readAsDataURL(files);
    rd.onload = function (e) {
      document.getElementById("channel_img").src = this.result;
    }
  }

  //送出新增
  btnCreateChannel.onclick = function () {

    let fileUrl;
    let files = fileInput.files[0];

    //新增圖片
    let formData = new FormData();
    formData.append('file', files);

    let xhr1 = new XMLHttpRequest();
    xhr1.open('POST', "/ipodcast/logged/files/channel/img", false);
    xhr1.onreadystatechange = getFileUrl;
    xhr1.send(formData);

    //新增圖片回傳
    function getFileUrl() {
      if (xhr1.readyState === XMLHttpRequest.DONE) {
        let responseJson = JSON.parse(xhr1.responseText);
        if (xhr1.status === 200) {
          fileUrl = responseJson['data']['file'];
          createChannel();

        } 
      }
    }

    //送出新增表單
    function createChannel() {

      let formData = new FormData(form);
      

      let xhr2 = new XMLHttpRequest();

      formData.append("image", fileUrl);
      xhr2.open('POST', `/ipodcast/logged/podcaster/channel`, false);
      xhr2.onreadystatechange = createResult;
      xhr2.send(formData);

      //新增結果
      function createResult() {
        if (xhr2.readyState === XMLHttpRequest.DONE) {
          let responseJson = JSON.parse(xhr2.responseText);
          if (xhr2.status === 200) {
   
			
			Swal.fire(
			  '成功',
			  responseJson['data']['channel'],
			  'success'
			);
            //alert(responseJson['data']['channel']);
         
            refresh();

          } else {
            if (xhr2.status === 400) {
              invalid(responseJson);
            }
          }
        }

      }
    }

    function invalid(responseJson) {
      let errors = responseJson['errors'];
      for (let name in errors) {
        document.getElementById(name).className += "is-invalid";
        document.getElementById(name + "_invalid_text").innerHTML = errors[name];
      }
    }


  };



}

function load(){
  findAll();

  findAllCategories();
}


function refresh(){
  bsOffcanvas.hide();       
  form.reset();
  document.getElementById("channel_img").src="";
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


//查詢全部
function findAll () {
  var container = $("#pagination-container");
  container.pagination({
    dataSource: `/ipodcast/logged/podcaster/channel`,
    alias: {
      pageNumber: 'page',
      pageSize: 'size'
    },
    locator: 'data.elements',
    totalNumber: 30,
    pageSize: 6,
    totalNumberLocator: function (response) {
      return response.data.total;
    },
    callback: function (response, pagination) {
      displayCards(response);
    },
    className: 'paginationjs-big'
  });

};


//處理Card畫面

function displayCards(elements) {

  cardContainer.innerHTML = "";
  for (let i = 0; i < elements.length; i++) {
    let element = elements[i];
    let card = createCardHtml(element['image'], element['title'], element['description'], element['id']);
    cardContainer.insertAdjacentHTML('beforeend', String(card));
  }

}

//Card Html
function createCardHtml(imgSrc, title, desrc, id) {
  let cardHtml = `
      <div class="col">
        <div class="card shadow-sm h-100  ">
          <img src="${imgSrc}" class="card-img-top"></img>
          <div class="card-body">
            <h5 class="card-title">${title}</h5>
            <p class="card-text text-truncate">${desrc}</p>
            <div class="d-flex justify-content-between align-items-center">
               <a href="/ipodcast/logged/podcaster/channel-info/${id}" class="btn btn-outline-secondary">編輯</a>
            </div>
          </div>
        </div>
      </div>
    `;
  return cardHtml;
}

//查詢全部category
function findAllCategories(){
  let xhr0 = new XMLHttpRequest();
  xhr0.open('GET', '/ipodcast/categories', true);
  xhr0.onreadystatechange = showCategories;
  xhr0.send();

  //顯示全部類別
  function showCategories() {
    if (xhr0.readyState === XMLHttpRequest.DONE) {
      let responseJson = JSON.parse(xhr0.responseText);
      if (xhr0.status === 200) {
        var data = responseJson['data'];
        categoriesSelect.innerHTML="";
        for (var en_name in data) {
          categoriesSelect.options.add(new Option(data[en_name], en_name));
        }
      }
    }

  };


}