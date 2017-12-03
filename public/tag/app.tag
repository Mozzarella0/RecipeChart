<app>

  <app-header></app-header>
    <div id="content">
      <!-- ここにルーティング先を表示させてる -->
    </div>
  <app-footer></app-footer>

  <script>
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
      if (window.userData != null) {
        riot.mount('#content', 'app-writerecipe');
      } else if(window.userData == null) {
        riot.mount('#content', 'app-auth');
      }
      riot.mount('app-header', 'app-header', {writerecipe : 1});
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
