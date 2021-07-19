
let adListContainer = document.getElementById("adListContainer");
let cid = document.getElementById("cid").value;

window.onload = function(){

  load();
  //加入 on clik
  $(document.body).on("click", ".addToChannel", function(){

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
  $(document.body).on("click", ".deleteFromChannel", function(){

      let url = this.dataset.url;
      let aid = this.dataset.aid;
      let deleteUrl = url +"/" + aid;
      let xhr = new XMLHttpRequest();
      xhr.open("DELETE", deleteUrl, true);
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

function findAll(){
  var container = $("#pagination-container");
  container.pagination({
    dataSource: `/ipodcast/logged/podcaster/channel/${cid}/record`,
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
      let card = creatRowAdHtml(element['id'], element['company'], element['text'], element['pictureString'],element['url'], element['adClick'], element['bonus'], element['addAdToChannelUrl'], element['enable']);
      adListContainer.insertAdjacentHTML('beforeend', String(card));
    }


}

//產生一橫列的 ad html
function creatRowAdHtml(id, company, text,pictureString, url, adClick, bonus, addAdToChannelUrl, enable){
    let btnHtml;
    if(enable === true){
        btnHtml = `<button class="btn btn-outline-primary addToChannel" type="button"  data-url="${addAdToChannelUrl}" data-aid="${id}">加入前頁</button>
                   <button class="btn btn-outline-danger" type="button" disabled>取消加入</button>
        `;
        
    }else{
        btnHtml = `<button class="btn btn-outline-primary" disabled>已加入前頁</button>
                   <button class="btn btn-outline-danger deleteFromChannel" type="button" data-url="${addAdToChannelUrl}" data-aid="${id}">取消加入</button>
        `;
    }
    

    let rowHtml = `
        <tr>
            <td>${company}</td>
            <td>${text}</td>
            <td>${url}</td>
            <td><img width='100' src='${pictureString }'></td>
            <td>${adClick}</td>
            <td>${bonus}</td>
            <td>
                ${btnHtml}
            </td>
        </tr> 
    `;
    return rowHtml;
}
