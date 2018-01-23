<app-only>
  <div class="ui container">
    <div class="ui clearing segment">
      <h2 class="ui horizontal divider header">{ window.onlyobj.recipeData.recipeName }</h2>
      <div class="ui two column grid">
        <div class="ui center aligned column">
          <div class="sixteen wide column" style="white-space:pre-wrap;">
            <h4>{ window.onlyobj.recipeData.recipeComment }</h4>
          </div>
        </div>
        <div class="ui center aligned column">
          <h4>{ person }</h4>
          <div each="{ key, data in window.onlyobj.recipeData.material }">
            { key.materialName } : { key.amount }
          </div>
        </div>
      </div>
      <div class="ui equal width center aligned grid">
          <flowchart name="view"></flowchart>
          <p></p>
      </div>
      <div class="ui sixteen wide column onlycreator">
        <div class="ui divider"></div>
        Create By <a>{ window.onlyobj.creator }</a>
      </div>
    </div>
  </div>

  <script>
    var arr = window.onlyobj.recipeData.recipeContent;
    window.flowChartData = {};
    for(var key in arr){
      window.flowChartData[key] = arr[key];
    }
    window.flowChartData.recipeId = window.onlyobj.recipeId;
    this.person = window.onlyobj.recipeData.material.person;
    delete window.onlyobj.recipeData.material.person;
    console.log(window.onlyobj.recipeData.material);
  </script>

  <style>
    .onlycreator {
      position: relative;
      top: 50px;
    }
  </style>
</app-only>
