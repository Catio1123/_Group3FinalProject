//Channel ID
let cid = document.getElementById("cid").value;
let categoriesSelect = document.getElementById("category");
let title = document.getElementById("title");
let description = document.getElementById("description");
let channelImg = document.getElementById("channel_img");
let fileInput = document.getElementById("input_channel_img");
let btnUpdateChan = document.getElementById("btn_update_channel");
let btnDeleteChannel = document.getElementById("btn_delete_channel");
let imgUrl = "";

window.onload = function(){

  load();

    //預覽圖片
    fileInput.onchange = function(){
        var rd = new FileReader();
        var files = this.files[0];
        rd.readAsDataURL(files);
        rd.onload = function(e){
         channelImg.src = this.result;
        }
    };



    //送出更新
    btnUpdateChan.onclick=function(){

        
       
        let files = fileInput.files[0];
        if(files != null){
          sendImg(files);
        }
    
        
        updateChannel(imgUrl);
  
      
      };

    // 刪除Channel
    btnDeleteChannel.onclick = function(){

        let deleteChannel = new XMLHttpRequest();
        deleteChannel.open('DELETE', `/ipodcast/logged/podcaster/channel/${cid}`, false)
        deleteChannel.onreadystatechange = checkDeleteResult;
        deleteChannel.send();

        function checkDeleteResult(){
            if(deleteChannel.readyState === XMLHttpRequest.DONE){
                let responseJson = JSON.parse(deleteChannel.responseText);
                if(deleteChannel.status === 200){
                	Swal.fire(
					  '成功',
					  responseJson['data']['channel'],
					  'success'
					).then((result) =>{
						 window.location.href = `/ipodcast/logged/podcaster/podcaster-info`;
						
					});
                
                    //alert(responseJson['data']['channel']);
                    //window.location.href = `/ipodcast/logged/podcaster/podcaster-info`;
                }


            }
        }

    };

}

function load(){
  findAllCategories();
  findChannelInfo();

};


 
        //送出更新
function updateChannel(fileUrl){
  let xhr2 = new XMLHttpRequest();
  let formData = new FormData(document.getElementById("form_channel"))
  formData.append("image", fileUrl);
  xhr2.open('PUT', `/ipodcast/logged/podcaster/channel/${cid}`, false);
  xhr2.onreadystatechange = createResult;
  xhr2.send(formData);

  //新增結果
  function createResult(){
    if(xhr2.readyState === XMLHttpRequest.DONE){
      let responseJson = JSON.parse(xhr2.responseText);
      if(xhr2.status === 200){
        Swal.fire(
		  '成功',
		  responseJson['data']['channel'],
		  'success'
		);
        //alert(responseJson['data']['channel']);
        load();

      }else{
          if(xhr2.status === 400){
              invalid(responseJson);
          }
      }
    }

  }
}
  


function invalid(responseJson){
  let errors = responseJson['errors'];
  for(let name in errors){
    document.getElementById(name).className += "is-invalid";
    document.getElementById(name + "_invalid_text").innerHTML=errors[name];
  }
}


function sendImg(files){
  
  let formData = new FormData();
  formData.append('file', files);

  let xhr1 = new XMLHttpRequest();
  xhr1.open('POST', "/ipodcast/logged/files/channel/img", false);
  xhr1.onreadystatechange = getFileUrl;
  xhr1.send(formData);

  //新增圖片回傳
  function getFileUrl(){
    if(xhr1.readyState === XMLHttpRequest.DONE){
      let responseJson = JSON.parse(xhr1.responseText);
      if(xhr1.status === 200){
        imgUrl = responseJson['data']['file'];
        
      }
    }
  }
  
}

function  findAllCategories(){
   //查詢category
   let getCategories = new XMLHttpRequest();
   getCategories.open("GET", "/ipodcast/categories", true);
   getCategories.onreadystatechange = showCategories
   getCategories.send();

   //顯示categories
   function showCategories(){
       if(getCategories.readyState === XMLHttpRequest.DONE){
           let responseJson = JSON.parse(getCategories.responseText);
           if(getCategories.status === 200){
              categoriesSelect.innerHTML="";
               let data  =responseJson['data'];
               for(var en_name in data){
                   categoriesSelect.options.add(new Option(data[en_name], en_name));
               }
           }
       }


   }
};

function findChannelInfo(){
   //查詢頻道資訊
   let getChannelInfo = new XMLHttpRequest();
   getChannelInfo.open('GET', `/ipodcast/logged/podcaster/channel/${cid}`, true);
   getChannelInfo.onreadystatechange = displayChannelInfo
   getChannelInfo.send();

   //顯示Channel Info
   function displayChannelInfo(){
       if(getChannelInfo.readyState === XMLHttpRequest.DONE){
           let responseJson = JSON.parse(getChannelInfo.responseText);
           if(getChannelInfo.status == 200){
               let data = responseJson['data'];

               title.value = data['title'];
               description.value = data['description'];
               channelImg.src = data['image'];
               imgUrl = data['image'];
               categoriesSelect.value = data['category'];
           }
       }
   
   };
}

