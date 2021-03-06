<app-viewrecipe>
  <div class="ui container">
    <div class="ui clearing segment">
      <h2 class="ui  horizontal divider header">View Recipe</h2>
      <recipeblock recipedata="{ recipeData }" accountdata="{ accountData }"></recipeblock>

    </div>
  </div>



  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';

    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
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

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.uid = user.uid;
        this.update()
      } else {

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

  </style>
</app-viewrecipe>
