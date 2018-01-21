<recipeblock>
  <div class="ui two column grid">
    <div each="{ key,data in recipeData}" class="column" >
      <div class="ui segment">
        <div class="{ data }">
          <a class="ui right corner label" href="" onclick="{ addfavo.bind(key, data) }" if="{ !key.favo }">
            <div data-tooltip="Add Myfolder">
              <i class="folder open outline icon"></i>
            </div>
          </a>
          <a class="ui orange right corner label" href="" onclick="{ dltfavo.bind(key, data) }" if="{ key.favo }">
            <div data-tooltip="Delete Myfolder">
              <i class="folder outline icon"></i>
            </div>
          </a>
          <div onclick="{ onlyrecipe.bind(key, data) }" style="cursor: pointer;">
            <div class="ui vertical center aligned segment">
              <small style="opacity: 0.6"> { key.date }</small>
              <h3>{ key.recipeName }</h3>
            </div>
            <div class="ui vertical segment">
              <i if="{ +key.recipeComment.length < 50}">{ key.recipeComment } </i>
              <i if="{ +key.recipeComment.length > 50}">{ key.recipeComment.substr(0, 50) } ... </i>
            </div>
            <div class="ui vertical right aligned segment">
              <small>By { opts.accountdata[key.creatorId].displayName }</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    import firebase from '../../firebase-config';
    import route from 'riot-route';

    const favorecipe = (favodata,uid,recipedata) => {
      var obj = {};
      Object.keys(favodata).forEach(function (key) { //使用者のfavoだけにしている
        if (favodata[key].user == uid){
          obj[key] = favodata[key];
        }
      });
      this.myfavo = obj;
      Object.keys(recipedata).forEach(function (key) { //レシピデータ全件を回す
        var flg = 0;
        Object.keys(obj).forEach(function (index) { //使用者のfavoデータ全件回す
          if (obj[index].recipeId == key){ //favoデータ内のrecipeIdとレシピデータのIDが同じだったら
            recipedata[key].favo = 1; //favoという項目を追加して1
            flg = 1;
          } else if (flg != 1){
            recipedata[key].favo = 0;
          }
        });
        if (recipedata[key].favo != 1 && opts.type == 'folder') { //マイフォルダからのマウントなら
          delete recipedata[key]; //favoされていないレシピは消す
        }
      });
      this.recipeData = recipedata;
      this.update();
    }


    const favos = firebase.database().ref('/favo');
    this.addfavo = (data, click) => {
      favos.push({
        user : this.uid,
        recipeId : data
      });
    };

    this.dltfavo = (data, click) => {
      var gr;
      var obj = this.myfavo;
      Object.keys(obj).forEach(function (index) {
        if (obj[index].recipeId == data){
          gr = index;
        }
      });
      const dltFavo = firebase.database().ref(`/favo/${gr}`);
      dltFavo.remove();
      if (Object.keys(obj).length == 1){
        riot.mount('#content', 'app-viewrecipe'); //最後の一つのfavoを消した時だけ反映されないから…こうだぞ！！
      }
    };

    favos.on('value', (favo) => {
      if(favo.val()) {
        this.favoData = favo.val();
        favorecipe(this.favoData,this.uid,opts.recipedata);
      }else{
      }
    });

    this.onlyrecipe = (data, click) => {
      window.onlyobj = {
        recipeData : click.item.key,
        recipeId : data,
        creator : opts.accountdata[click.item.key.creatorId].displayName
      };
      window.recipeId = data;
      route(`/viewonly/${data}`);
    };

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.uid = user.uid;
        favorecipe(this.favoData,this.uid,opts.recipedata);
        this.update()
      } else {

      }
    });


  </script>
  <style>

  </style>
</recipeblock>
