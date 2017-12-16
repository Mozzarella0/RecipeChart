<app-mypage>
  <div class="ui container">
    <div class="ui clearing segment">
      <h3 class="ui horizontal divider header">
        <i class="write icon"></i>
        Your Recipes
      </h3>
      <recipeblock recipedata="{ recipeData }" accountdata="{ accountData }"></recipeblock>
    </div>
    <div class="ui clearing orange segment">
      <h3 class="ui horizontal divider header">
        <i class="folder icon"></i>
        Your Folder
      </h3>
      <recipeblock recipedata="{ recipeData }" accountdata="{ accountData }" type="folder"></recipeblock>
    </div>
  </div>

  <script>
    import firebase from '../firebase-config';

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.uid = user.uid;
        this.update()
        myrecipe(opts.recipeData,this.uid,'auth');
      } else {

      }
    });

    const recipes = firebase.database().ref('recipeData');
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        this.recipeData = opts.recipeData;
        this.recipeData = recipe.val();
        console.log(recipe.val());
        if (!this.uid){ this.uid = opts.user.uid; }
        this.update();
        myrecipe(this.recipeData,this.uid,'recipe');
      }else{
      }
    });

    const accounts = firebase.database().ref('account');
    this.accountData = {};
    accounts.on('value', (account) => {
      if(account.val()) {
        this.accountData = account.val();
        this.update();
      }else{
      }
    });

    const myrecipe = (data,uid,type) => {
      var newobj = {};
      console.log(type);
      console.log(data);

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
