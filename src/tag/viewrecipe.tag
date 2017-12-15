<app-viewrecipe>
  <div class="ui container">
    <div class="ui clearing segment">
      <h2 class="ui  horizontal divider header">View Recipe</h2>
      <recipeblock recipedata="{ recipeData }" accountdata="{ accountData }"></recipeblock>
    </div>
  </div>


  <div class="viewLoadCon">
    <div class="ui active inverted dimmer">
      <div class="ui large text loader">Loading</div>
    </div>
  </div>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';

    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        $(".viewLoadCon").hide();
        $(".viewrecipe").fadeIn();
        this.recipeData = recipe.val();
        this.update();
        // console.log(this.recipeData);
      }else{
      }
    });

    const accounts = firebase.database().ref('account');
    this.accountData = {};
    accounts.on('value', (account) => {
      if(account.val()) {
        this.accountData = account.val();
        this.update();
        // console.log(this.accountData);
      }else{
      }
    });

    if (opts.keyword) {
      var re = new RegExp('.*' + opts.keyword + '.*');
      var obj = this.recipeData;
      var newobj = {};

      Object.keys(obj).forEach(function (key) {
        if (obj[key].recipeName.match(re) || obj[key].recipeComment.match(re)){
          newobj[key] = obj[key];
        }
      });
      this.recipeData = newobj
      this.update();
    }

  </script>

  <style>
    .viewLoadCon{
      position: fixed;
      margin-left: 50%;
      margin-top: 40%;
    }
  </style>
</app-viewrecipe>
