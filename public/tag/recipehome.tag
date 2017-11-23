<app-recipehome>
  <div class="ui container">
    <h2>Recipes</h2>
    <div class="ui divider"></div>
    <div class="ui middle aligned center aligned grid">
      <div class="ui grid">
        <div each="{ key,data in recipeData }" class="ui segment">
          <div class="{ key }">
            <a class="ui orange basic button ">
              <h4 if="{ +data.recipeName.length < 11 }">{ data.recipeName }</h4>
              <h4 if="{ +data.recipeName.length > 10 }">{ data.recipeName.substr(0, 10) } ...</h4>
              <div class="comment" if="{ +data.recipeComment.length < 11}">
                <i>{ data.recipeComment }</i>
              </div>
              <div class="comment" if="{ +data.recipeComment.length > 10}">
                <i>{ data.recipeComment.substr(0, 10) } ...</i>
              </div>
              <div class="ui divider"></div>
              <div class="creator">
                <i class="ui right aligned">Creator ... { data.creator }</i>
              </div>
            </a>
          </div>
        </div>
    </div>
  </div>
  </div>
  <script>
    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        this.recipeData = recipe.val();
        this.update();
      }else{
      }
    });
  </script>
  <style>
  </style>
</app-recipehome>
