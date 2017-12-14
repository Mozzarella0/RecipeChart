<app-viewrecipe>
  <div class="ui container">
    <h2 class="ui  horizontal divider header">View Recipe</h2>
    <div class="ui grid">
      <div class="sixteen wide column">
        <div each="{ key,data in recipeData }" class="ui clearing segment" >
          <div class="{ data }">
            <div onclick="{ onlyrecipe.bind(key, data) }" style="cursor: pointer;">
              <h3>{ key.recipeName }</h3>
              <div class="comment" >
                <i if="{ +key.recipeComment.length < 100}">{ key.recipeComment } </i>
                <i if="{ +key.recipeComment.length > 100}">{ key.recipeComment.substr(0, 100) } ... </i>
                <p></p><small>By { accountData[key.creatorId].displayName }</small>
              </div>
              <div class="ui divider"></div>
              <div class="ui inverted right floated circular orange icon button" data-tooltip="Collect">
                <i class="book orange icon"></i>
              </div>

            </div>
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

    this.onlyrecipe = (data, click) => {
      window.onlyobj = {
        recipeData : click.item.key,
        recipeId : data,
        creator : this.accountData[click.item.key.creatorId].displayName
      };
      window.recipeId = data;
      route(`/viewonly/${data}`);
    };

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
