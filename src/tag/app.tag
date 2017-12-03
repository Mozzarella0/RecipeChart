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

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        window.userData = user;
        this.update();
      }
    });

    //ルーティング
    route('/', () => {
      riot.mount('#content', 'app-home');
      riot.mount('app-header', 'app-header');
    });
    route('/auth', () => {
      riot.mount('#content', 'app-auth');
    });
    route('/mypage', () => {
      riot.mount('#content', 'app-mypage');
    });
    route('/viewrecipe', () => {
      riot.mount('#content', 'app-viewrecipe');
      riot.mount('app-header', 'app-header', {viewrecipe : 1});
    });
    route('/writerecipe', () => {
      riot.mount('#content', 'app-writerecipe');
      riot.mount('app-header', 'app-header', {writerecipe : 1});
    });
    route('/viewonly/*', () => {
      riot.mount('#content', 'app-only');
      riot.mount('app-header', 'app-header', {viewrecipe : 1});
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
