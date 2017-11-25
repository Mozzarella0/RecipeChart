<app-only>
  <div class="ui container">

    <h2 class="ui horizontal divider header">{ opts.data.recipeName }</h2>
    <div class="ui equal width center aligned grid">
      <div class="sixteen wide column">
        <h4>{ opts.data.recipeComment }</h4>
      </div>
        <div class="flowChart"></div>
    </div>
    <i class="big circular refresh link orange icon" data-toggle="tooltip" title="更新" onclick="{ refresh }"></i>
  </div>

  <script>
  this.refresh = () => { //見た目の更新
    riot.mount('.flowChart', 'flowchart', { chartData : chartData });
  };

    const arr = opts.data.recipeContent;
    var chartData = {};
    for(key in arr){
      chartData[key] = arr[key];
    }
    console.log(chartData);
    // riot.mount('.flowChart', 'flowchart', { chartData : chartData });


  </script>
</app-only>
