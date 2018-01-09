<app-writerecipe>
  <div class="ui container">
    <div class="ui attached segment">
      <div class="ui equal width grid">
        <div class="sixteen wide column">
          <div class="ui form">
            <h2 class="ui  horizontal divider header">Write Recipe</h2>
            <div class="ui segments">
              <div class="ui secondary segment">
                概要
              </div>
              <div class="ui clearing segment">
                <div class="field">
                  <label>レシピの名前</label>
                  <div class="ui left icon input">
                    <i class="book icon"></i>
                    <input placeholder="type here" ref="recipeName" value="NewRecipe"></input>
                  </div>
                </div>
                <div class="field">
                  <label>コメント</label>
                  <textarea placeholder="type here" ref="recipeComment" rows="2"></textarea>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="sixteen wide column">
          <div class="ui segments">
            <div class="ui secondary segment">
              <i class="cubes icon"></i>
              材料
            </div>
            <div class="ui attached segment">
              <div class="ui form">
                <div class="field">
                  <div class="ui left input">
                    <input placeholder="例：〇人前" ref="person"></input>
                  </div>
                </div>
                <div class="two fields">
                  <div class="field">
                    <input placeholder="例：水" ref="person"></input>
                  </div>
                  <div class="field">
                    <input placeholder="例：1L" ref="person"></input>
                  </div>
                </div>
                <div class="two fields">
                  <div class="field">
                    <input placeholder="例：塩" ref="person"></input>
                  </div>
                  <div class="field">
                    <input placeholder="例：300g" ref="person"></input>
                  </div>
                </div>
              </div>
            </div>
            <div class="ui attached inverted orange btn-text button" tabindex="0">
              <i class="plus icon"></i>
            </div>
          </div>

        </div>

        <div class="equal width row">
          <div class="column">
            <div class="ui form">
              <h3 class="ui horizontal divider header">
                <i class="list icon"></i>
                処理
              </h3>
              <process></process>
            </div>
            <div class="ui two buttons">
              <button class="ui attached inverted orange button" data-tooltip="プロセスの追加" data-position="bottom center" onclick="{ addProcess }">
                <i class="plus icon"></i>
              </button>
              <button class="ui attached inverted orange button" data-tooltip="プロセスの削除" data-position="bottom center" onclick="{ dltProcess }">
                <i class="minus icon"></i>
              </button>
            </div>
          </div>
          <div class="column">
            <div class="ui form">
              <h3 class="ui horizontal divider header">
                <i class="lightning icon"></i>
                チャート
              </h3>
              <div class="ui attached segment">
                <flowchart name="write"></flowchart>
              </div>
              <div class="ui attached inverted orange btn-text button" data-tooltip="更新" data-position="bottom center" onclick="{ refresh }">
                <i class="refresh icon" ></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="ui attached orange btn-text button" tabindex="0" onClick="{ add }">
      Done
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

  </style>
</app-writerecipe>
