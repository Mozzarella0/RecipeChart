<app-header>
  <div class="ui grid">
    <div class="ui fixed inverted borderless menu">
      <a class="ui inverted grey button btn-text" href="/" if="{ !user }">
        <i class="book icon"></i>
        ホーム
      </a>
      <a class="ui inverted grey button btn-text" href="/recipehome" if="{ user }">
        <i class="book icon"></i>
        ホーム
      </a>
      <a class="ui inverted orange button btn-text" href="/mypage" if="{ user }">
        <i class="user icon"></i>
        マイページ
      </a>
      <a class="ui inverted orange button btn-text" href="/recipe" if="{ user }">
        <i class="write icon"></i>
        レシピ
      </a>
      <div class="right menu">
        <a class="ui inverted orange button btn-text" href="/auth" if="{ !user }">
          <i class="user icon"></i>
          ログイン
        </a>
        <a class="ui inverted red button btn-text" onclick="{ signout }" if="{ user }">
          <i class="sign out icon"></i>
          ログアウト
        </a>
      </div>
    </div>
  </div>

  <script>
    firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      this.displayName = user.displayName;
      var email = user.email;
      var emailVerified = user.emailVerified;
      var photoURL = user.photoURL;
      var isAnonymous = user.isAnonymous;
      var uid = user.uid;
      var providerData = user.providerData;
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
      route('header');
    }).catch(function(error) {
      // An error happened.
    });
  };



  </script>

</app-header>
