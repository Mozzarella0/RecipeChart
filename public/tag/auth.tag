<app-auth>
  <div class="container">
  <h2>ログイン</h2>
  <div class="column">
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
        <button class="ui fluid large orange submit button" onclick="signin()">
          ログイン
        </button>
      </div>
    </form>
    <!-- ログインフォーム end -->

    <div class="ui message">
      <p>アカウントを持っていませんか？<a data-toggle="modal" data-target="#signUpModal">Sign Up</a></p>
    </div>
  </div>

    <hr></hr>

    <button class="ui google plus button" onclick="{ googleAuth }">
      <i class="google icon"></i>
      Login with Google
    </button>
    <button class="ui twitter button">
      <i class="twitter icon"></i>
      Login with Twitter
    </button>
  </div>

  <!-- サインアップモーダル start -->
  <div class="modal fade" id="signUpModal" tabindex="-1">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
  				<h2 class="modal-title">Sign Up</h2>
  			</div>
  			<div class="modal-body">
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
              <hr></hr>
              <button class="ui fluid large orange submit button" onclick="signup()">
                Sign Up
              </button>
            </div>
          </form>
  			</div>
  		</div>
  	</div>
  </div>
  <!-- サインアップモーダル end -->

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
    var provider = new firebase.auth.GoogleAuthProvider();
    this.googleAuth = function(){
      console.log("ログイン");
      firebase.auth().signInWithPopup(provider).then(function (result) {
        var user = result.user;
        console.log(user);
        console.log('Your Name:' + user.displayName);
        route('/recipehome');
      }).catch(function (error) {
        // エラー処理 errorはオブジェクト
        route('/recipehome');
        console.log(error);
      });
    };


  </script>

  <style>

  </style>

</app-auth>
