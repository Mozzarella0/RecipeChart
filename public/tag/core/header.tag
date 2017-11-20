<app-header>
  <div class="ui grid">
    <div class="ui fixed inverted borderless menu">
      <a class="ui inverted grey button btn-text" href="/" if="{ !user }">
        <i class="desktop icon"></i>
        ホーム
      </a>
      <a class="ui inverted grey button btn-text" href="/recipehome" if="{ user }">
        <i class="desktop icon"></i>
        ホーム
      </a>
      <a class="ui inverted grey button btn-text" href="/recipe" if="{ user }">
        <i class="write icon"></i>
        つくる
      </a>
      <div class="right menu">
        <a class="ui inverted orange button btn-text" href="/auth" if="{ !user }">
          <i class="user icon"></i>
          ログイン
        </a>
        <div if="{ user }">
          <div class="ui compact menu userbtn">
            <div class="ui simple dropdown item">
              <img class="ui avatar image" src="{ photoURL }">
              <span class="username">{ displayName }さん</span>
              <i class="dropdown icon"></i>
              <div class="menu">
                <a class="item" href="/mypage">
                  <i class="book icon"></i>
                  マイレシピ
                </a>
                <a class="item">
                  <i class="options icon" href="#"></i>
                  設定
                </a>
                <div class="item" onclick="{ signout }">
                  <a class="ui inverted red button">
                    <i class="sign out icon" ></i>
                    ログアウト
                  </a>
                </div>
              </div>
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
    .username {
      color: black;
    }

    .userbtn {
      height: 32px;
    }
  </style>


</app-header>
