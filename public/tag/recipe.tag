<app-recipe>
  <div class="container">

    <div class="ui form">
      <div class="field">
        <textarea style="height: 150px;" id="chartData" >terminal=開始;{ String.fromCharCode(13); }</textarea>
      </div>
    </div>
    <p></p>
      <button class="ui black button btn-text" data-toggle="tooltip" title="開始 / 終了" onClick="{ writeTerminal }">Terminal</button>
      <button class="ui black button btn-text" data-toggle="tooltip" title="処理" onClick="{ writeProcess }">Process</button>
      <button class="ui black button btn-text" data-toggle="tooltip" title="判断" onClick="{ writeDecision }">Decision</button>
      <button class="ui black button btn-text" data-toggle="tooltip" title="データ" onClick="{ writeInput }">Input</button>
      <button class="ui black button btn-text" data-toggle="tooltip" title="ループ（開始）" onClick="{ writeLoopstart }">Loop-Start</button>
      <button class="ui black button btn-text" data-toggle="tooltip" title="ループ（終了）" onClick="{ writeLoopend }">Loop-End</button>
    <hr></hr>
    <p>
      <button class="ui button btn-text" onClick="{ refresh }">
        <i class="Refresh icon"></i>
        Refresh
      </button>
      <div class="flowChart"></div>
    </p>
  </div>

  <script>

    this.refresh = () => {
      const text = document.getElementById('chartData').value;
      riot.mount('.flowChart', 'flowchart', { text : text });
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
      document.getElementById('chartData').value += 'input=;' + String.fromCharCode(13);
    };

    this.writeLoopstart = () => {
      document.getElementById('chartData').value += 'loop-start;' + String.fromCharCode(13) + String.fromCharCode(13);
    };

    this.writeLoopend = () => {
      document.getElementById('chartData').value += 'loop-end;' + String.fromCharCode(13);
    };




  </script>

  <style>

  </style>
</app-recipe>
