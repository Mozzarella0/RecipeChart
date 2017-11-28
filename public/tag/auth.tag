<app-auth>
  <div class="ui container loginform">
    <h2>ログイン</h2>

    <!-- ログインフォーム start -->
    <form class="ui large form">
      <div class="ui segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="email" placeholder="E-mail address"></input>
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password"></input>
          </div>
        </div>
        <button class="ui fluid large orange submit button" onclick="signin">
          ログイン
        </button>
      </div>
      <div class="ui error message"></div>
    </form>
    <!-- ログインフォーム end -->

    <div class="ui message">
      <p>アカウントを持っていませんか？<a data-toggle="modal" data-target="#signUpModal">Sign Up</a></p>
    </div>


    <div class="ui divider"></div>

    <button class="ui google plus button" onclick="{ googleAuth }">
      <i class="google icon"></i>
      Login with Google
    </button>
      <button class="ui twitter button">
      <i class="twitter icon"></i>
      Login with Twitter
    </button>
  </div>

  <script>
    //email login
    signin() {
      firebase.auth().signInWithEmailAndPassword(this.refs.email.value, this.refs.password.value).then(
        function() {
          console.log("signup success!")
        },
        function(error) {
          that.error_message = error.message
          that.update()
        }
      )
    }

    //google
    const provider = new firebase.auth.GoogleAuthProvider();
    this.googleAuth = function(){
      console.log("ログイン");
      firebase.auth().signInWithPopup(provider).then(function (result) {
        const user = result.user;
        const textRef = firebase.database().ref(`/account/${user.uid}`);
        textRef.update({
          displayName : user.displayName
        });
        route('/viewrecipe');
      }).catch(function (error) {
        // エラー処理 errorはオブジェクト
        route('/viewrecipe');
        console.log(error);
      });
    };

// userのuidのキーの中にdisplayName : displayNameを入れる
  </script>

  <style>

  </style>

</app-auth>
