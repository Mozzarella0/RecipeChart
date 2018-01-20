<app-auth>
  <!-- ログインフォーム start -->
  <div class="ui container loginform">

    <div class="ui two column grid">
      <div class="column" >
        <div class="ui segment">
          <div class="ui header">
            外部サービスでサインイン
          </div>
          <div class="ui large form">
            <div class="field">
              <button class="ui fluid google plus button" onclick="{ googleAuth }">
                <i class="google icon"></i>
                Googleでサインイン
              </button>
            </div>
            <div class="field">
              <button class="ui fluid twitter button">
                <i class="twitter icon"></i>
                Twitterでサインイン
              </button>
            </div>
            <div class="field">
              <button class="ui fluid black button">
                <i class="ui github icon"></i>
                githubでサインイン
              </button>
            </div>
          </div>
        </div>
      </div>

      <div class="column" >
        <div class="ui segment">
          <div class="ui large form">
            <div class="ui header">
              メールアドレスでサインイン
            </div>
            <div class="field">
              <div class="ui left icon input">
                <i class="user icon"></i>
                <input type="text" ref="email" placeholder="E-mail address"></input>
              </div>
            </div>
            <div class="field">
              <div class="ui left icon input">
                <i class="lock icon"></i>
                <input type="password" ref="password" placeholder="Password"></input>
              </div>
            </div>
            <button class="ui fluid large orange button" onclick="{ signin }">
              サインイン
            </button>
            <div class="ui error message"></div>
          </div>
        </div>
      </div>
    </div>


    <!-- ログインフォーム end -->



    <div class="ui divider"></div>

    <div class="ui message">
      <p>アカウントを持っていませんか？<a onclick="{ signupModal }">Sign Up</a></p>
    </div>

  </div>

  <div class="ui modal signup">
    <div class="header">サインアップ</div>
      <div class="content">
        <form class="ui large form">
          <div class="field">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <input type="text" name="newemail" placeholder="E-mail address"></input>
            </div>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <input type="password" name="newpassword" placeholder="Password"></input>
            </div>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <input type="password" name="newpasswordR" placeholder="Retype here"></input>
            </div>
          </div>
          <div class="footer">
            <button class="ui fluid large orange submit button" onclick="{ signup }">
              サインアップ
            </button>
          </div>
        </form>
      </div>
  </div>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';

    //email login
    this.signin = () => {
      firebase.auth().signInWithEmailAndPassword(this.refs.email.value, this.refs.password.value).then(
        function() {
          console.log("signin success!");
          route('/viewrecipe');
        },
        function(error) {
          that.error_message = error.message
          that.update()
        }
      )
    }

    //google
    const provider = new firebase.auth.GoogleAuthProvider();
    this.googleAuth = () => {
      console.log("ログイン");
      firebase.auth().signInWithPopup(provider).then(function (result) {
        const user = result.user;
        const textRef = firebase.database().ref(`/account/${user.uid}`);
        textRef.update({
          displayName : user.displayName
        });
        route('/viewrecipe');
        $('.ui.modal#login').modal('hide');
      }).catch(function (error) {
        // エラー処理 errorはオブジェクト
        route('/viewrecipe');
        console.log(error);
      });
    };

    this.signupModal = () => {
      $(`.ui.modal.signup`).modal('show');
    };

    this.signup = () => {
      firebase.auth().createUserWithEmailAndPassword(this.refs.newemail.value, this.refs.newpassword.value).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
      });
      $(`.ui.modal.signup`).modal('hide');
    }



  </script>

  <style>

  </style>

</app-auth>
