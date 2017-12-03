<app-writerecipe>
  <div class="ui container">
    <div class="ui equal width grid">
      <div class="sixteen wide column">

        <div class="ui form">
          <h2 class="ui  horizontal divider header">Write Recipe</h2>
          <div class="field">
            <label>レシピの名前</label>
            <div class="ui left icon input">
              <i class="book icon"></i>
              <input placeholder="type here" id="recipeName" value="NewRecipe"></input>
            </div>
          </div>
          <div class="field">
            <label>コメント</label>
            <div class="ui left icon input">
              <i class="comment outline icon"></i>
              <input placeholder="type here" id="recipeComment"></input>
            </div>
          </div>
        </div>

      </div>
      <button class="ui fluid orange button btn-text" onClick="{ add }">Done</button>
      <p></p>
      <div class="equal width row">
        <div class="column">
          <div class="ui form">
            <h3 class="ui horizontal divider header">Process</h3>
            <div class="unit"></div>
          </div>
        </div>
        <div class="column">
          <div class="ui form">
            <h3 class="ui horizontal divider header">View</h3>
            <div class="flowChart"></div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div class="plusMinusMenu">
    <i class="big circular refresh link orange icon" data-toggle="tooltip" title="更新" onclick="{ refresh }"></i>
    <i class="big circular plus link orange icon" data-toggle="tooltip" title="プロセスの追加" onclick="{ addProcess }"></i>
    <i class="big circular minus link orange icon" data-toggle="tooltip" title="プロセスの削除" onclick="{ dltProcess }"></i>
  </div>


  <script>
    var processName = ["terminal", "process", "decision", "inout", "loop-s", "loop-e"];
    var chartData = {0: { content : "開始", detail : "", processName : "terminal"} };
    var num = 1;

    const objRefresh = () => { //処理内容の更新関数
      for(var i=0; num > i; i++){
        var formRadio = i + '_radio_';
        var formContent = i + '_content';
        var formDetail = i + '_content_detail';
        for(var j=0; processName.length > j; j++){
          var gr = formRadio + processName[j];
          if(document.getElementById(gr).checked) break;
        }
        var obj = {};
        obj.processName = processName[j];
        obj.content = document.getElementById(formContent).value;
        obj.detail = document.getElementById(formDetail).value;
        chartData[i] = obj;
      }
    }

    const textRef = firebase.database().ref('/recipeData');

    this.on('mount', () => {
      riot.mount('.unit', 'process', { chartData : chartData });
      riot.mount('.flowChart', 'flowchart', { chartData : chartData });
    });

    this.addProcess = () => { //処理の追加
      objRefresh();
      var obj = {};
      obj.processName = obj.content = obj.detail = "";
      chartData[num++] = obj;
      console.log(chartData);
      riot.mount('.unit', 'process', { chartData : chartData });
      riot.mount('.flowChart', 'flowchart', { chartData : chartData });
    };


    this.dltProcess = () => { //処理の削除
      objRefresh();
      delete chartData[--num];
      console.log(chartData);
      riot.mount('.unit', 'process', { chartData : chartData });
      riot.mount('.flowChart', 'flowchart', { chartData : chartData });
    };

    this.refresh = () => { //見た目の更新
      objRefresh();
      riot.mount('.flowChart', 'flowchart', { chartData : chartData });
    };

    this.add = () => {
      objRefresh();
      const date = new Date();
      const year = date.getFullYear();
      const month = date.getMonth()+1;
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();
      var name = document.getElementById('recipeName').value;
      var comment = document.getElementById('recipeComment').value;
      if (name == "") {name = 'NewRecipe';}
      if (comment == "") {comment = 'No Comment...';}
      textRef.push({
        creatorId : window.userData.uid,
        recipeName : name,
        recipeComment : comment,
        recipeContent : chartData,
        date : year + '/' + month + '/' + day + ' ' + hour + ':' + minute
      });
      route('viewrecipe');

    };

  </script>

  <style>

    .plusMinusMenu {
      position: fixed;
      top: 80%;
      left: 90%;
    }

  </style>
</app-writerecipe>
