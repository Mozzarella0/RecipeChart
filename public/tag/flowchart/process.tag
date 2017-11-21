<process>
  <div class="ui container">
    <div class="ui grid">
      <div each="{ key, i in opts.chartForm }" class="sixteen wide column" >
        <div class="ui divider"></div>
        <div class="{ i }">
          <div class="ui form">
            <h3>{ i + 1 }.</h3>
            <div class="inline fields">
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" checked="checked" type="radio">
                  <label>端子</label>
                </div>
              </div>
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" type="radio">
                  <label>処理</label>
                </div>
              </div>
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" type="radio">
                  <label>判断</label>
                </div>
              </div>
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" type="radio">
                  <label>入出力</label>
                </div>
              </div>
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" type="radio">
                  <label>ループ開始</label>
                </div>
              </div>
              <div class="field">
                <div class="ui radio checkbox">
                  <input name="{ i }" type="radio">
                  <label>ループ終了</label>
                </div>
              </div>
            </div>

              <div class="field">
                <label>内容</label>
                <div class="ui left icon input">
                  <i class="sticky note icon"></i>
                  <input placeholder="type here" id="recipeName"></input>
                </div>
              </div>
              <div class="field">
                <label>詳しい手順(任意)</label>
                <div class="ui left icon input">
                  <i class="comments outline icon"></i>
                  <input placeholder="type here" id="recipeName"></input>
                </div>
              </div>


          </div>
        </div>

      </div>
    </div>
  </div>

  <script>

  </script>

  <style>

  </style>

</process>
