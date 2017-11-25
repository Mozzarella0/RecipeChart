<app>

  <app-header></app-header>
    <div id="content">
      <!-- ここにルーティング先を表示させてる -->
    </div>
  <app-footer></app-footer>

  <script>
    var userData = {};
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        userData = user;
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
    route('/viewrecipe', () => {
      riot.mount('#content', 'app-viewrecipe');
      riot.mount('app-header', 'app-header', {viewrecipe : 1});
    });
    route('/writerecipe', () => {
      riot.mount('#content', 'app-writerecipe', {userData : userData});
      riot.mount('app-header', 'app-header', {writerecipe : 1});
    });

  </script>

  <style>
    #content {
      position: relative;
      top: 100px;
    }
  </style>

</app>
