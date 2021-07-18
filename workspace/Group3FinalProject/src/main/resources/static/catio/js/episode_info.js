let eid = document.getElementById("eid").value;
let cid = document.getElementById("cid").value;
let title = document.getElementById("title");
let fileInput = document.getElementById("epFile");
let description = document.getElementById("description");
let audioSource = document.getElementById("audio_source");
let audio = document.getElementById("audio");
let btnUpdate = document.getElementById("btn_update_channel");
let btnDelete = document.getElementById("btn_delete_channel");
let epFile;

window.onload = function(){
   
    load();

    //送出更新
    btnUpdate.onclick = function(){
        let fileUrl;
        let files = fileInput.files[0];

        if(files === undefined){
            fileUrl = epFile;
        }else{
            
            sendAudioFile(files);
        }
        updateEp(fileUrl);

    };
    
    //刪除
    btnDelete.onclick = function(){
        let xhr2 = new XMLHttpRequest();
        let url = `/ipodcast/logged/podcaster/channel/${cid}/episode/${eid}`;
        xhr2.open('DELETE', url, false);
        xhr2.onreadystatechange = createResult;
        xhr2.send();

        //新增結果
        function createResult() {
            if (xhr2.readyState === XMLHttpRequest.DONE) {
                let responseJson = JSON.parse(xhr2.responseText);
                if (xhr2.status === 200) {
                    alert(responseJson['data']['episode']);
                    window.location.href = `/ipodcast/logged/podcaster/channel/${cid}/episode-list`;

                } 
            }

        }
    }

}

function load(){
    findEpInfo();
}


//送出update表單
function updateEp(fileUrl) {
    let xhr2 = new XMLHttpRequest();
    let formData = new FormData(document.getElementById("form_episode"))
    formData.append("epFile", fileUrl);
    let url = `/ipodcast/logged/podcaster/channel/${cid}/episode/${eid}`;
    xhr2.open('PUT', url, false);
    xhr2.onreadystatechange = createResult;
    xhr2.send(formData);

    //update結果
    function createResult() {
        if (xhr2.readyState === XMLHttpRequest.DONE) {
            let responseJson = JSON.parse(xhr2.responseText);
            if (xhr2.status === 200) {
                alert(responseJson['data']['episode']);
                load();

            } else {
                if (xhr2.status === 400) {
                    invalid(responseJson);
                }
            };
        }

    }
};

//上傳audio
function sendAudioFile(files){
    //新增音檔
    let formData = new FormData();
    formData.append('file', files);

    let xhr1 = new XMLHttpRequest();
    xhr1.open('POST', "http://localhost:8080/ipodcast/files/episode/sound", false);
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

}


//查詢 episode
function findEpInfo(){
    let getCategories = new XMLHttpRequest();
    let url = `/ipodcast/logged/podcaster/channel/${cid}/episode/${eid}`;
    getCategories.open("GET", url, false);
    getCategories.onreadystatechange = showEpInfo
    getCategories.send();

    //顯示episode info
    function showEpInfo(){
        if(getCategories.readyState === XMLHttpRequest.DONE){
            let responseJson = JSON.parse(getCategories.responseText);
            if(getCategories.status === 200){
                let data  =responseJson['data'];
                title.value = data['title'];
                description.value = data['description'];
                audioSource.src = data['epFile'];
                epFile = data['epFile'];
                audio.load();
                }
            }
    }
}

//處理 invalid
function invalid(responseJson) {
    let errors = responseJson['errors'];
    for (let name in errors) {
      document.getElementById(name).className += " is-invalid";
      document.getElementById(name + "_invalid_text").innerHTML = errors[name];
    }
  }

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
