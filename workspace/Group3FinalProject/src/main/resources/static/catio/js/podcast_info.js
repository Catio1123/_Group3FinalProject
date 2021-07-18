
let cid = document.getElementById("cid").value;
let title = document.getElementById("title");
let podcaster = document.getElementById("podcaster");
let category = document.getElementById("category");
let description = document.getElementById("description");
let podcastImg = document.getElementById("podcastImg");
let adContainer = document.getElementById("adContainer");
let epContainer = document.getElementById("epContainer");
window.onload = function(){

  load();

  $(document.body).on('click', ".ad-img", function(){
    let clickCountUrl = this.dataset.clickcount;
    let xhr = new XMLHttpRequest();
    xhr.open("POST", clickCountUrl, true);
    xhr.send();
  })
 
}
  

function load(){
  findPodcastInfo();
  findAdList();
}

//查詢podcast 資訊
function findPodcastInfo(){

  let xhr = new XMLHttpRequest();
  xhr.open("GET", `/ipodcast/podcast/${cid}`, true);
  xhr.onreadystatechange = showPodcastInfo;
  xhr.send();

  function showPodcastInfo(){
    if(xhr.readyState === XMLHttpRequest.DONE){
      let responseJson = JSON.parse(xhr.responseText);
      if(xhr.status === 200){
        let data = responseJson['data'];
        title.innerHTML = data['title'];
        podcastImg.src = data['image'];
        category.innerHTML = data['category'];
        description.innerHTML = data['description'];
        podcaster.innerHTML = data['podcaster'];
      }

    }

  }

};

//查詢廣告列表
function findAdList(){
  let xhr = new XMLHttpRequest();
  xhr.open("GET", `/ipodcast/podcast/${cid}/ad`, true);
  xhr.onreadystatechange = showPodcastInfo;
  xhr.send();

  function showPodcastInfo(){
    if(xhr.readyState === XMLHttpRequest.DONE){
      let responseJson = JSON.parse(xhr.responseText);
      if(xhr.status === 200){
        displayAdBlock(responseJson['data']['ads']);
      }

    }

  }


}


//顯示廣告清單
function displayAdBlock(ads){

  adContainer.innerHTML = "";
    for (let i = 0; i < ads.length; i++) {
      let ad = ads[i];
      let adBlock = creatAdBlockHtml(ad['url'], ad['pictureString'], ad['clickCountUrl'], ad['text']);
      adContainer.insertAdjacentHTML('beforeend', String(adBlock));
    }


}

//產生 ad block html
function creatAdBlockHtml(url, pictureString, clickCountUrl,text){
    let adBlock = `
          <figure>
          <a href="${url}" target="_blank">
           <image class="my-2 ad-img" src="${pictureString}" style="width: 200px; height: 100px;" data-clickcount="${clickCountUrl}" title="${text}"/>
         
      </a>
       <figcaption  style="width: 200px;">${text}</figcaption>
      </figure>
    `;
    
    return adBlock;
}
