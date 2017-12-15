<app-writerecipe>
  <div class="ui container">
    <div class="ui clearing segment">
      <div class="ui equal width grid">
        <div class="sixteen wide column">

          <div class="ui form clearing segment">
            <h2 class="ui  horizontal divider header">Write Recipe</h2>
            <div class="field">
              <label>レシピの名前</label>
              <div class="ui left icon input">
                <i class="book icon"></i>
                <input placeholder="type here" ref="recipeName" value="NewRecipe"></input>
              </div>
            </div>
            <div class="field">
              <label>コメント</label>
              <div class="ui left icon input">
                <i class="comment outline icon"></i>
                <input placeholder="type here" ref="recipeComment"></input>
              </div>
            </div>
          </div>

        </div>
        <button class="ui fluid orange button btn-text" onClick="{ add }">Done</button>
        <p></p>
        <div class="equal width row">
          <div class="column">
            <div class="ui form">
              <div class="ui clearing segment">
                <h3 class="ui horizontal divider header">Process</h3>
                <process></process>
              </div>
            </div>
          </div>
          <div class="column">
            <div class="ui form">
              <h3 class="ui horizontal divider header">View</h3>
              <flowchart name="write"></flowchart>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div class="plusMinusMenu ui clearing segment">
    <div data-tooltip="更新" data-position="left center" onclick="{ refresh }">
      <i class="big circular refresh link orange icon" ></i>
    </div>
    <div data-tooltip="プロセスの追加" data-position="left center" onclick="{ addProcess }">
      <i class="big circular plus link orange icon"></i>
    </div>
    <div data-tooltip="プロセスの削除" data-position="left center" onclick="{ dltProcess }">
      <i class="big circular minus link orange icon"></i>
    </div>
  </div>


  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';
    import './flowchart/flowchart.tag';
    import './flowchart/process.tag';

    var processName = ["terminal", "process", "decision", "inout", "loop-s", "loop-e"];
    window.flowChartData = {0: { content : "開始", detail : "", processName : "terminal"} };
    window.recipeId = 'write';
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
        window.flowChartData[i] = obj;
      }
    }

    const textRef = firebase.database().ref('/recipeData');

    this.addProcess = () => { //処理の追加
      objRefresh();
      var obj = {};
      obj.processName = obj.content = obj.detail = "";
      window.flowChartData[num++] = obj;
      this.update();
    };

    this.dltProcess = () => { //処理の削除
      objRefresh();
      delete window.flowChartData[--num];
      this.update();
    };

    this.refresh = () => { //見た目の更新
      objRefresh();
      this.update();
    };

    this.add = () => {
      objRefresh();
      const date = new Date();
      const year = date.getFullYear();
      const month = date.getMonth()+1;
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();
      var name = this.refs.recipeName.value;
      var comment = this.refs.recipeComment.value;
      if (name == "") {name = 'NewRecipe';}
      if (comment == "") {comment = 'No Comment...';}
      textRef.push({
        creatorId : window.userData.uid,
        recipeName : name,
        recipeComment : comment,
        recipeContent : window.flowChartData,
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
