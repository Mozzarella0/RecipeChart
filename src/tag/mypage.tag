<app-mypage>
  <div class="ui container">
    <div class="ui clearing segment">
      <h3 class="ui horizontal divider header">
        <i class="write icon"></i>
        Your Recipes
      </h3>
      <recipeblock recipedata="{ recipeData }" accountdata="{ accountData }"></recipeblock>
    </div>
    <div class="ui clearing segment">
      <h3 class="ui horizontal divider header">
        <i class="book icon"></i>
        Your Book
      </h3>
    </div>
  </div>

  <script>
    import firebase from '../firebase-config';

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.uid = user.uid;
        this.update()
        myrecipe(this.recipeData,this.uid);
      } else {

      }
    });

    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        $(".viewLoadCon").hide();
        $(".viewrecipe").fadeIn();
        this.recipeData = recipe.val();
        myrecipe(this.recipeData,this.uid);
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

    const myrecipe = (data,uid) => {
      var newobj = {};

      Object.keys(data).forEach(function (key) {
        if (data[key].creatorId == uid){
          newobj[key] = data[key];
        }
      });
      this.recipeData = newobj;
      this.update();
    }

  </script>
</app-mypage>
