<app-only>
  <div class="ui container">
    <div class="recipeMenu">
      <i class="big circular arrow left link orange icon" onclick="{ back }"></i>
    </div>
    <h2 class="ui horizontal divider header">{ opts.data.recipeName }</h2>
    <div class="ui equal width center aligned grid">
      <div class="sixteen wide column">
        <h4>{ opts.data.recipeComment }</h4>
      </div>
        <div class="flowChart"></div>
        <p></p>
    </div>
    <div class="ui sixteen wide column onlycreator">
      <div class="ui divider"></div>
      Create By <a>{ opts.accountData[opts.data.creatorId].displayName }</a>
    </div>
  </div>
  <script>
    const arr = opts.data.recipeContent;
    var chartData = {};
    for(key in arr){
      chartData[key] = arr[key];
    }
    this.on('mount', () => {
      riot.mount('.flowChart', 'flowchart', { chartData : chartData });
    });
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
