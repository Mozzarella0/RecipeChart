<app>

  <app-header></app-header>
    <div id="content">
      <!-- ここにルーティング先を表示させてる -->
    </div>
  <app-footer></app-footer>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';
    import './core/header.tag';
    import './auth.tag';
    import './home.tag';
    import './mypage.tag';
    import './recipe.tag';
    import './recipehome.tag';

    var userData = {};
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        userData = user;
        // const displayName = user.displayName;
        // var email = user.email;
        // var emailVerified = user.emailVerified;
        // var photoURL = user.photoURL;
        // var isAnonymous = user.isAnonymous;
        // var uid = user.uid;
        // var providerData = user.providerData;
        this.update();
      } else {
        userData = null;
      }
    });

    //ルーティング
    route('/', () => {
      riot.mount('#content', 'app-home', {userData : userData});
      riot.mount('app-header', 'app-header');
    });
    route('/auth', () => {
      riot.mount('#content', 'app-auth');
    });
    route('/mypage', () => {
      riot.mount('#content', 'app-mypage');
    });
    route('/recipehome', () => {
      riot.mount('#content', 'app-recipehome');
      riot.mount('app-header', 'app-header', {recipehome : 1});
    });
    route('/recipe', () => {
      riot.mount('#content', 'app-recipe', {userData : userData});
      riot.mount('app-header', 'app-header', {recipe : 1});
    });

  </script>

  <style>
    #content {
      position: relative;
      top: 100px;
    }
  </style>

</app>
