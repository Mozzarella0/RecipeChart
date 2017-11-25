<app-header>
  <div class="ui grid">
    <div class="ui fixed inverted borderless menu">
      <a class="header item" href="/" if="{ !user }">
        <h4>
          <i class="large industry icon"></i>
          RecipeChart
        </h4>
      </a>
      <div class="header item" if="{ user }">
        <h4>
          <i class="large industry orange icon"></i>
          RecipeChart
        </h4>
      </div>
      <a class="header item" href="/viewrecipe" if="{ user }">
        <i class="large book icon" if="{ !opts.viewrecipe }"></i>
        <i class="large book orange icon" if="{ opts.viewrecipe }"></i>
      </a>
      <a class="header item" href="/writerecipe" if="{ user }">
        <i class="large write icon" if="{ !opts.writerecipe }"></i>
        <i class="large write orange icon" if="{ opts.writerecipe }"></i>
      </a>

      <div class="right menu item">
        <a class="ui inverted orange button btn-text" href="/auth" if="{ !user }">
          <i class="user icon"></i>
          ログイン
        </a>
        <div if="{ user }"> <!-- ユーザーメニュードロップダウン -->

          <div class="ui simple dropdown">
            <img class="ui avatar image" src="{ photoURL }"></img>
            <span class="username">{ displayName } さん</span>
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

  <script>

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

  </script>

  <style>

  </style>


</app-header>
