<app-recipehome>
  <div class="container">
    <h2>Recipes</h2>
    <div each="{ key,data in recipeData }" class="recipeBlock" >
      <div class="{ key }">
        <i>{ data.creator }</i>
      </div>
    </div>

  </div>
  

  <script>
    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};

    recipes.on('value', function(recipe) {
      if(recipe.val()) {
        this.recipeData = recipe.val();
      }else{

      }
    });

  </script>

  <style>

  </style>


</app-recipehome>
