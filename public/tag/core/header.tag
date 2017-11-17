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
        <div if="{ user }">
          { displayName } さん
        </div>
        
        <div class="ui teal buttons">
          <div class="ui button">Save</div>
          <div class="ui floating dropdown icon button">
            <i class="dropdown icon"></i>
            <div class="menu">
              <div class="item"><i class="edit icon"></i> Edit Post</div>
              <div class="item"><i class="delete icon"></i> Remove Post</div>
              <div class="item"><i class="hide icon"></i> Hide Post</div>
            </div>
          </div>
        </div>

        <!-- <a class="ui inverted red button btn-text" onclick="{ signout }" if="{ user }">
          <i class="sign out icon"></i>
          ログアウト
        </a> -->
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

</app-header>
