<app-recipe>
  <div class="ui container">
    <div class="ui form">
      <h3 class="ui dividing header">Write Recipe</h3>
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
      <div class="field">
        <div class="ui buttons">
          <button class="ui black button btn-text" data-toggle="tooltip" title="開始 / 終了" onClick="{ writeTerminal }">Terminal</button>
          <button class="ui black button btn-text" data-toggle="tooltip" title="処理" onClick="{ writeProcess }">Process</button>
          <button class="ui black button btn-text" data-toggle="tooltip" title="判断" onClick="{ writeDecision }">Decision</button>
          <button class="ui black button btn-text" data-toggle="tooltip" title="データ" onClick="{ writeInput }">Input / Output</button>
          <button class="ui black button btn-text" data-toggle="tooltip" title="ループ（開始）" onClick="{ writeLoopstart }">Loop-Start</button>
          <button class="ui black button btn-text" data-toggle="tooltip" title="ループ（終了）" onClick="{ writeLoopend }">Loop-End</button>
        </div>
        <button class="ui orange button btn-text" onClick="{ add }">Done</button>
      </div>

      <div class="field">
        <textarea style="height: 150px;" id="chartData" >terminal=開始;{ String.fromCharCode(13); }</textarea>
      </div>

      <div class="field">
        <i class="big plus link orange icon" onclick="{ addProcess }"></i>
      </div>

      <div class="unit"></div>

      <div class="ui divider"></div>
      <a class="ui button btn-text" onClick="{ refresh }">
        <i class="Refresh icon"></i>
        Refresh
      </a>
      <div class="flowChart"></div>
    </div>
  </div>

  <script>
    var chartForm = [];

    this.addProcess = () => {
      chartForm.push("test");
      riot.mount('.unit', 'process', { chartForm : chartForm });
    };

    const textRef = firebase.database().ref('/recipeData');
    textRef.on('value',(res)=>{
      console.log(res.val());
    });

    this.refresh = () => {
      const text = document.getElementById('chartData').value;
      riot.mount('.flowChart', 'flowchart', { text : text });
    };

    this.add = () => {
      const date = new Date();
      const year = date.getFullYear();
      const month = date.getMonth()+1;
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();

      textRef.push({
        creator : opts.userData.displayName,
        recipeName : document.getElementById('recipeName').value,
        recipeComment : document.getElementById('recipeComment').value,
        recipeContent : document.getElementById('chartData').value,
        date : year + '/' + month + '/' + day + ' ' + hour + ':' + minute
      });
    };

    this.writeTerminal = () => {
      document.getElementById('chartData').value += 'terminal=;' + String.fromCharCode(13);
    };

    this.writeProcess = () => {
      document.getElementById('chartData').value += 'process=;' + String.fromCharCode(13);
    };

    this.writeDecision = () => {
      document.getElementById('chartData').value += 'decision=;' + String.fromCharCode(13);
    };

    this.writeInput = () => {
      document.getElementById('chartData').value += 'inoutput=;' + String.fromCharCode(13);
    };

    this.writeLoopstart = () => {
      document.getElementById('chartData').value += 'loop-start=;' + String.fromCharCode(13);
    };

    this.writeLoopend = () => {
      document.getElementById('chartData').value += 'loop-end=;' + String.fromCharCode(13);
    };

  </script>

  <style>

  </style>
</app-recipe>
