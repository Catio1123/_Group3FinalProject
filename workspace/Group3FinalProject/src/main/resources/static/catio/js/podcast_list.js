
let podcastListContainer = document.getElementById("podcastListContainer");
let btnDemo1 = document.getElementById("btnDemo1");
let btnDemo2 = document.getElementById("btnDemo2");
let btnDemo3 = document.getElementById("btnDemo3");
let btnDemo4 = document.getElementById("btnDemo4");
let btnDemo5 = document.getElementById("btnDemo5");
let btnDemo6 = document.getElementById("btnDemo6");

let andPrecisePodcastTitle = document.getElementById("and_precise_podcast_title");
let andPreciseCategoryName = document.getElementById("and_precise_category_cnName");
let andPrecisePodcasterName = document.getElementById("and_precise_podcaster_name");

let andFuzzyPodcastTitle = document.getElementById("and_fuzzy_podcast_title");
let andFuzzyCategoryName = document.getElementById("and_fuzzy_category_cnName");
let andFuzzzyPodcasterName = document.getElementById("and_fuzzy_podcaster_name");


let orPrecisePodcastTitle = document.getElementById("or_precise_podcast_title");
let orPreciseCategoryName = document.getElementById("or_precise_category_cnName");
let orPrecisePodcasterName = document.getElementById("or_precise_podcaster_name");

let orFuzzyPodcastTitle = document.getElementById("or_fuzzy_podcast_title");
let orFuzzyCategoryName = document.getElementById("or_fuzzy_category_cnName");
let orFuzzyPodcasterName = document.getElementById("or_fuzzy_podcaster_name");


window.onload = function(){

  load();

  

  btnSearch.onclick = function(){
    query();
  }

  btnDemo1.onclick = demo1Click;
  btnDemo2.onclick = demo2Click;
  btnDemo3.onclick = demo3Click;
  btnDemo4.onclick = demo4Click;
  btnDemo5.onclick = demo5Click;
  btnDemo6.onclick = demo6Click;
 
}
  

function load(){
 findAll();
}

function findAll(){
  
  var container = $("#pagination-container");
  container.pagination({
    dataSource: "/ipodcast/podcast",
    alias: {
      pageNumber: 'page',
      pageSize: 'size'
    },
    locator: 'data.elements',
    totalNumber: 36,
    pageSize: 9,
    totalNumberLocator: function (response) {
      return response.data.total;
    },
    callback: function (response, pagination) {
      displayPodcastList(response);
    },
    className: 'paginationjs-big'
  });

};


function demo1Click(){
  andPrecisePodcastTitle.value = "深夜食堂";

}
function demo2Click(){
  andFuzzyCategoryName.value = "情";
}

function demo3Click(){
  andPrecisePodcasterName.value = "Backy";
}

function demo4Click(){
  orFuzzyPodcastTitle.value = "大叔";
}

function demo5Click(){
  orPreciseCategoryName.value = "求學";
}

function demo6Click(){
  orFuzzyPodcasterName.value = "黛";
}

function query(){
 
  let channelTitleValue;
  if(andPrecisePodcastTitle.value === "" && andFuzzyPodcastTitle.value === ""){
    channelTitleValue = ""
  }else if (andPrecisePodcastTitle.value != "" && andFuzzyPodcastTitle.value === ""){
    channelTitleValue = `${andPrecisePodcastTitle.value}`;
  }else if (andPrecisePodcastTitle.value === "" && andFuzzyPodcastTitle.value != ""){
    channelTitleValue = `*${andFuzzyPodcastTitle.value}*`;
  }else if (andPrecisePodcastTitle.value != "" && andFuzzyPodcastTitle.value != ""){
    channelTitleValue = `${andPrecisePodcastTitle.value},*${andFuzzyPodcastTitle.value}*`;
  }

  let categoryCnNameValue;
  if(andPreciseCategoryName.value === "" && andFuzzyCategoryName.value === ""){
    categoryCnNameValue = ""
  }else if (andPreciseCategoryName.value != "" && andFuzzyCategoryName.value === ""){
    categoryCnNameValue =`${andPreciseCategoryName.value}`;
  }else if (andPreciseCategoryName.value === "" && andFuzzyCategoryName.value != ""){
    categoryCnNameValue = `*${andFuzzyCategoryName.value}*`;
  }else if (andPreciseCategoryName.value != "" && andFuzzyCategoryName.value != ""){
    categoryCnNameValue = `${andPreciseCategoryName.value},*${andFuzzyCategoryName.value}*`;
  }

 
  let podcasterNameValue;
  if(andPrecisePodcasterName.value === "" && andFuzzzyPodcasterName.value === ""){
    podcasterNameValue = ""
  }else if (andPrecisePodcasterName.value != "" && andFuzzzyPodcasterName.value === ""){
    podcasterNameValue = `${andPrecisePodcasterName.value}`;
  }else if (andPrecisePodcasterName.value === "" && andFuzzzyPodcasterName.value != ""){
    podcasterNameValue = `*${andFuzzzyPodcasterName.value}*`;
  }else if (andPrecisePodcasterName.value != "" && andFuzzzyPodcasterName.value != ""){
    podcasterNameValue = `${andPrecisePodcasterName.value},*${andFuzzzyPodcasterName.value}*`;
  }
  let orChannelTitileValue;
  if(orPrecisePodcastTitle.value === "" && orFuzzyPodcastTitle.value === ""){
    orChannelTitileValue = ""
  }else if (orPrecisePodcastTitle.value != "" && orFuzzyPodcastTitle.value === ""){
    orChannelTitileValue = `${orPrecisePodcastTitle.value}`;
  }else if (orPrecisePodcastTitle.value === "" && orFuzzyPodcastTitle.value != ""){
    orChannelTitileValue = `*${orFuzzyPodcastTitle.value}*`;
  }else if (orPrecisePodcastTitle.value != "" && orFuzzyPodcastTitle.value != ""){
    orChannelTitileValue = `${orPrecisePodcastTitle.value},*${orFuzzyPodcastTitle.value}*`;
  }

  let orCategoryCnNameValue;
  if(orPreciseCategoryName.value === "" && orFuzzyCategoryName.value === ""){
    orCategoryCnNameValue = ""
  }else if (orPreciseCategoryName.value != "" && orFuzzyCategoryName.value === ""){
    orCategoryCnNameValue = `${orPreciseCategoryName.value}`;
  }else if (orPreciseCategoryName.value === "" && orFuzzyCategoryName.value != ""){
    orCategoryCnNameValue = `*${orFuzzyCategoryName.value}*`;
  }else if (orPreciseCategoryName.value != "" && orFuzzyCategoryName.value != ""){
    orCategoryCnNameValue =`${orPreciseCategoryName.value},*${orFuzzyCategoryName.value}*`;
  }

  let orPodcasterNameValue;
  if(orPrecisePodcasterName.value === "" && orFuzzyPodcasterName.value === ""){
    orPodcasterNameValue = ""
  }else if (orPrecisePodcasterName.value != "" && orFuzzyPodcasterName.value === ""){
    orPodcasterNameValue = `${orPrecisePodcasterName.value},*${orFuzzyPodcasterName.value}*`;
  }else if (orPrecisePodcasterName.value === "" && orFuzzyPodcasterName.value != ""){
    orPodcasterNameValue = `${orPrecisePodcasterName.value},*${orFuzzyPodcasterName.value}*`;
  }else if (orPrecisePodcasterName.value != "" && orFuzzyPodcasterName.value != ""){
    orPodcasterNameValue =`${orPrecisePodcasterName.value},*${orFuzzyPodcasterName.value}*`;
  }



  var container = $("#pagination-container");
  container.pagination({
    dataSource: "/ipodcast/podcast",
    alias: {
      pageNumber: 'page',
      pageSize: 'size'
    },
  	ajax:{
      data: {
        channel_title:channelTitleValue,
        category_cnName:categoryCnNameValue,
        podcaster_name:podcasterNameValue,
        or_channel_title:orChannelTitileValue,
        or_category_cnName:orCategoryCnNameValue,
        or_podcaster_name:orPodcasterNameValue,

      },
    },
    locator: 'data.elements',
    totalNumber: 36,
    pageSize: 9,
    totalNumberLocator: function (response) {
      return response.data.total;
    },
    callback: function (response, pagination) {
      displayPodcastList(response);
    },
    className: 'paginationjs-big'
  });
};

//顯示Podcast
function displayPodcastList(elements){

  podcastListContainer.innerHTML = "";
    for (let i = 0; i < elements.length; i++) {
      let element = elements[i];
      let card = creatPodcastCardHtml(element['id'], element['title'], element['image'], element['category'], element['description'], element['podcaster']);
      podcastListContainer.insertAdjacentHTML('beforeend', String(card));
    }


}

//產生 podcast card html
function creatPodcastCardHtml(id, title, image, category, description, podcaster){
    let podcasatCardHtml = `
      <a href="/ipodcast/podcast/${id}/podcast-info" class="custom-card">
        <div class="col">
          <div class="card shadow-sm">
            <img class="card-img-top" src="${image}" alt="">
            <div class="card-body pb-0">
              <h5 class="card-title">${title}</h5>
              <h6>${category}</h6>
              <p class="card-text text-truncate">${description}</p>
              <div class="d-flex justify-content-end align-items-center">
                <p>${podcaster}</p>
                
              </div>
            </div>
          </div>
        </div>
      </a>
    `;
    
    return podcasatCardHtml;
}
