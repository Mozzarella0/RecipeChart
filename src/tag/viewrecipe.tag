<app-viewrecipe>
  <div class="ui container viewrecipe">
    <h2>Recipes</h2>
    <div class="ui divider"></div>
    <div class="ui middle aligned center aligned grid">
      <div class="ui grid">
        <div each="{ key,data in recipeData }" class="ui segment">
          <div class="{ data }">
            <a class="ui orange basic button " onclick="{ onlyrecipe.bind(key, data) }">
              <h4 if="{ +key.recipeName.length < 11 }">{ key.recipeName }</h4>
              <h4 if="{ +key.recipeName.length > 10 }">{ key.recipeName.substr(0, 10) } ...</h4>
              <div class="comment" if="{ +key.recipeComment.length < 11}">
                <i>{ key.recipeComment }</i>
              </div>
              <div class="comment" if="{ +key.recipeComment.length > 10}">
                <i>{ key.recipeComment.substr(0, 10) } ...</i>
              </div>
              <div class="ui divider"></div>
              <div class="creator">
                <i class="ui right aligned">Creator ... { accountData[key.creatorId].displayName }</i>
              </div>
            </a>
          </div>
        </div>
      </div>
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
    window.flowChartData = {};

    const recipes = firebase.database().ref('recipeData');
    this.recipeData = {};
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        $(".viewLoadCon").fadeOut();
        $(".viewrecipe").fadeIn();
        this.recipeData = recipe.val();
        this.update();
        console.log(this.recipeData);
      }else{
      }
    });

    const accounts = firebase.database().ref('account');
    this.accountData = {};
    accounts.on('value', (account) => {
      if(account.val()) {
        this.accountData = account.val();
        this.update();
        console.log(this.accountData);
      }else{
      }
    });

    this.onlyrecipe = (data, click) => {
      window.onlyobj = {
        recipeData : click.item.key,
        recipeId : data,
        creator : this.accountData[click.item.key.creatorId].displayName
      };
      window.recipeId = data;
      route(`/viewonly/${data}`);
    };

  </script>
  <style>
    .viewLoadCon{
      position: fixed;
      margin-left: 50%;
      margin-top: 40%;
    }
  </style>
</app-viewrecipe>
