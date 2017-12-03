<app-header>
  <div class="ui grid">
    <div class="ui fixed inverted borderless menu">
      <a class="header item" href="/" if="{ !window.userData }">
        <h4>
          <i class="large industry icon"></i>
          RecipeChart
        </h4>
      </a>
      <div class="header item" if="{ window.userData }">
        <h4>
          <i class="large industry orange icon"></i>
          RecipeChart
        </h4>
      </div>
      <a class="header item" href="/viewrecipe">
        <i class="large book icon" if="{ !opts.viewrecipe }"></i>
        <i class="large book orange icon" if="{ opts.viewrecipe }"></i>
      </a>
      <a class="header item" href="/writerecipe" if="{ window.userData }">
        <i class="large write icon" if="{ !opts.writerecipe }"></i>
        <i class="large write orange icon" if="{ opts.writerecipe }"></i>
      </a>
      <a class="header item" if="{ !window.userData }" onclick="{ showLoginModal }">
        <i class="large write icon"></i>
      </a>

      <div class="right menu item">
        <a class="ui inverted orange button btn-text" href="/auth" if="{ !window.userData }">
          <i class="user icon"></i>
          ログイン
        </a>
        <div if="{ window.userData }"> <!-- ユーザーメニュードロップダウン -->

          <div class="ui simple dropdown">
            <img class="ui avatar image" src="{ window.userData.photoURL }"></img>
            <span class="username">{ window.userData.displayName } さん</span>
            <i class="dropdown icon"></i>
            <div class="menu">
              <a class="item" href="/mypage">
                <i class="book icon"></i>
                マイページ
              </a>
              <a class="item">
                <i class="options icon" href="#"></i>
                設定
              </a>
              <div class="ui divider"></div>
              <a class="item" onclick="{ signout }">
                <i class="sign out icon" ></i>
                ログアウト
              </a>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="ui modal" id="login">
      <div class="header">ログインが必要な操作です</div>
      <div class="content">
        <app-auth></app-auth>
      </div>
      <div class="footer">

      </div>
    </div>

  <script>
    import firebase from '../../firebase-config';
    import route from 'riot-route';

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.displayName = user.displayName;
        this.photoURL = user.photoURL;
        this.user = true;
        this.update()
      } else {

      }
    });

    this.signout = () => {
      firebase.auth().signOut().then(function() {
        // Sign-out successful.
        this.isUser = true;
        route('/');
      }).catch(function(error) {
        // An error happened.
      });
    };

    this.showLoginModal = () => {
      $('.ui.modal#login').modal('show');
    }

  </script>

  <style>

  </style>


</app-header>
