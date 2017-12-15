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
    import './flowchart/process.tag'
    import './recipeblock/recipeblock.tag'

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        window.userData = user;
        this.update();
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
      mounthing('app-writerecipe', 0, {writerecipe : 1});
    });
    route('/viewonly/*', () => {
      mounthing('app-only', 0, {viewrecipe : 1});
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
