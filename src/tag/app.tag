<app>

  <app-header></app-header>
  <div id="content"></div>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';
    import './core/header.tag';
    import './auth.tag';
    import './home.tag';
    import './mypage.tag';
    import './writerecipe.tag';
    import './viewrecipe.tag';
    import './only.tag';
    import './flowchart/flowchart.tag';
    import './flowchart/process.tag';
    import './flowchart/material.tag';
    import './recipeblock/recipeblock.tag';

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        window.userData = user;
        const textRef = firebase.database().ref(`/account/${user.uid}`);
        if (!user.displayName){
          var displayName = user.email;
        } else {
          var displayName = user.displayName;
        }
        textRef.update({
          displayName : displayName
        });
      this.update();
      }
    });

    const recipes = firebase.database().ref('recipeData');
    recipes.on('value', (recipe) => {
      if(recipe.val()) {
        window.recipeData = recipe.val();
      }else{
      }
    });

    const accounts = firebase.database().ref('account');
      accounts.on('value', (account) => {
      if(account.val()) {
        window.accountData = account.val();
        this.update();
      }else{
      }
    });

    const mounthing = (content, param, headparam) => {
      $('#content').hide();
      riot.mount('#content', content, param);
      riot.mount('app-header', 'app-header', headparam);
      $('#content').fadeIn();
    };

    //ルーティング
    route('/', () => {
      mounthing('app-home');
    });
    route('/auth', () => {
      mounthing('app-auth');
    });
    route('/mypage', () => {
      mounthing('app-mypage');
    });
    route('/viewrecipe', () => {
      mounthing('app-viewrecipe', { keyword : '' }, {viewrecipe : 1});
    });
    route('/writerecipe', () => {
      mounthing('app-writerecipe', { load : true }, {writerecipe : 1});
    });
    route('/viewonly/*', () => {
      mounthing('app-only', 0, { viewrecipe : 1 });
    });

  </script>

  <style>
    #content {
      position: relative;
      top: 100px;
    }

    .viewrecipe {
      display: none;
    }
  </style>

</app>
