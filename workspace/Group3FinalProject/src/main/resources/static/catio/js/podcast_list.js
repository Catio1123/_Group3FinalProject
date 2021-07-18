
let podcastListContainer = document.getElementById("podcastListContainer");
let btnSearch = document.getElementById("btnSearch");


window.onload = function(){

  load();

  document.getElementById("queryString").addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      query();
    }
  });

  btnSearch.onclick = function(){
    query();
  }

 
}
  

function load(){
 query();
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
    pageSize: 12,
    totalNumberLocator: function (response) {
      return response.data.total;
    },
    callback: function (response, pagination) {
      displayPodcastList(response);
    },
    className: 'paginationjs-big'
  });

};

function query(){
  let queryString = document.getElementById("queryString").value;
  var container = $("#pagination-container");
  container.pagination({
    dataSource: "/ipodcast/podcast",
    alias: {
      pageNumber: 'page',
      pageSize: 'size'
    },
  	ajax:{
      data: queryString
    },
    locator: 'data.elements',
    totalNumber: 36,
    pageSize: 12,
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
