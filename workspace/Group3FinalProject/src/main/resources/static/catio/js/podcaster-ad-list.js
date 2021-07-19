
let adListContainer = document.getElementById("adListContainer");

window.onload = function(){
    
  load();

  //加入 on clik
  $(document.body).on("click", ".btnAddAd", function(){

      let url = this.dataset.url;
      let aid = this.dataset.aid;
      let xhr = new XMLHttpRequest();
      xhr.open("POST", url, true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = sendAddRecord;
      xhr.send(`aid=${aid}`)

      //處理加入送出後ajax
      function sendAddRecord(){
          if(xhr.readyState === XMLHttpRequest.DONE){
              load();
          }
      
      }
  });

  //移除 on clik
  $(document.body).on("click", ".btnRemoveAd", function(){

    let aid = this.dataset.aid;
    let baseurl = this.dataset.url;
    let url = baseurl + '/' + aid;
      let xhr = new XMLHttpRequest();
      xhr.open("DELETE", url, true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = sendAddRecord;
      xhr.send()

      //處理加入送出後ajax
      function sendAddRecord(){
          if(xhr.readyState === XMLHttpRequest.DONE){
              load();
          }
      
      }
  });
}


  

function load(){
  findAll();
}

//查詢全部
function findAll() {
  var container = $("#pagination-container");
  container.pagination({
    dataSource: `/ipodcast/logged/podcaster/ad`,
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
      displayAdList(response);
    },
    className: 'paginationjs-big'
  });

};


//顯示廣告列表
function displayAdList(elements){

    adListContainer.innerHTML = "";
    for (let i = 0; i < elements.length; i++) {
      let element = elements[i];
      let card = creatRowAdHtml(element['id'], element['company'], element['text'], element['url'], element['recordUrl'], element['enable']);
      adListContainer.insertAdjacentHTML('beforeend', String(card));
    }


}

//產生一橫列的 ad html
function creatRowAdHtml(id, company, text, url, recordUrl, enable){
    let btnHtml;
    if(enable === true){
        btnHtml = `<button class="btn btn-outline-primary btnAddAd"  type="button" data-url="${recordUrl}" data-aid="${id}">加入</button>`;
        
    }else{
        btnHtml = `<button class="btn btn-outline-danger btnRemoveAd" type="button" data-url="${recordUrl}" data-aid="${id}">移除</button>`;
    }
    

    let rowHtml = `
        <tr>
            <td>${id}</td>
            <td>${company}</td>
            <td>${text}</td>
            <td>${url}</td>
            <td>
                ${btnHtml}
            </td>
        </tr> 
    `;
    return rowHtml;
}

