<process>
  <div class="ui container">
    <div class="ui grid">
      <div each="{ key, i in window.flowChartData }" class="sixteen wide column" >
        <div class="ui segments">
          <div class="ui secondary segment">
            <h3>{ +i + 1 }.</h3>
          </div>
          <div class="ui clearing segment">
            <div class="{ i }">
              <div class="ui form">

                <div class="inline fields">
                  <div class="field" each="{ data, j in chartProcessName }">
                    <div class="ui radio checkbox">
                      <input id="{ i + '_radio_' + j }" name="{ i + '_radio' }" type="radio" value="{ data }" checked="checked" if="{ key.processName == j }"/>
                      <input id="{ i + '_radio_' + j }" name="{ i + '_radio' }" type="radio" value="{ data }" if="{ key.processName != j }"/>
                      <label>{ data }</label>
                    </div>
                  </div>
                </div>

                <div class="field">
                  <label>内容</label>
                  <div class="ui left icon input">
                    <i class="sticky note icon"></i>
                    <input placeholder="type here" id="{ i + '_content' }" value="{ key.content }"></input>
                  </div>
                </div>

                <div class="field">
                  <label>詳しい手順(任意)</label>
                  <textarea placeholder="type here" id="{ i + '_content_detail' }" rows="2">{ key.detail }</textarea>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <script>
    this.chartProcessName = {"terminal" : "端子", "process" : "処理", "decision" : "判断", "inout" : "入出力", "loop-s" : "ループ開始", "loop-e" : "ループ終了"};
  </script>

  <style>

  </style>

</process>
