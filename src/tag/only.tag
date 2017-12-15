<app-only>
  <div class="ui container">
    <div class="recipeMenu">
      <i class="big circular arrow left link orange icon" onclick="{ back }"></i>
    </div>
    <div class="ui clearing segment">
      <h2 class="ui horizontal divider header">{ window.onlyobj.recipeData.recipeName }</h2>
      <div class="ui equal width center aligned grid">
        <div class="sixteen wide column">
          <h4>{ window.onlyobj.recipeData.recipeComment }</h4>
        </div>
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
    import route from 'riot-route';

    const arr = window.onlyobj.recipeData.recipeContent;
    window.flowChartData = {};
    for(var key in arr){
      window.flowChartData[key] = arr[key];
    }
    window.flowChartData.recipeId = window.onlyobj.recipeId

    this.back = () => {
      route('viewrecipe');
    };
  </script>

  <style>
    .onlycreator {
      position: relative;
      top: 50px;
    }
  </style>
</app-only>
