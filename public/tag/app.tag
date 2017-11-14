<app>

  <app-header></app-header>
    <div id="content">
      <!-- ここにルーティング先を表示させてる -->
    </div>
  <app-footer></app-footer>

  <script>
    const userData = {};
    var user;
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        user = true;
        this.displayName = user.displayName;
        var email = user.email;
        var emailVerified = user.emailVerified;
        var photoURL = user.photoURL;
        var isAnonymous = user.isAnonymous;
        var uid = user.uid;
        var providerData = user.providerData;
        this.update();
      } else {

      }
    });

    //ルーティング
    route('/', () => {
      riot.mount('#content', 'app-home');
    });
    route('/auth', () => {
      riot.mount('#content', 'app-auth');
    });
    route('/mypage', () => {
      riot.mount('#content', 'app-mypage');
    });
    route('/recipehome', () => {
      riot.mount('#content', 'app-recipehome')
    });
    route('/recipe', () => {
      riot.mount('#content', 'app-recipe')
    });

  </script>

  <style>
    #content {
      position: relative;
      top: 100px;
    }
  </style>

</app>
