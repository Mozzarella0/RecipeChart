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
            <div if="{ auth_error_message }" class="ui visible error message">
              { auth_error_message }
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- ログインフォーム end -->



    <div class="ui divider"></div>

    <div class="ui center aligned message">
      <p>アカウントを持っていませんか？<a onclick="{ signupModal }">Sign Up</a></p>
    </div>

  </div>

  <div class="ui modal signup">
    <div class="header">サインアップ</div>
      <div class="content">
        <div class="ui large form">
          <div class="field">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <input type="text" ref="newemail" placeholder="E-mail address"></input>
            </div>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <input type="password" ref="newpassword" placeholder="Password"></input>
            </div>
          </div>
          <div class="field">
            <div class="ui left icon input">
              <i class="lock icon"></i>
              <input type="password" ref="newpasswordR" placeholder="Retype here"></input>
            </div>
          </div>
          <div class="footer">
            <button class="ui fluid large orange button" onclick="{ signup }">
              サインアップ
            </button>
            <div if="{ create_error_message }" class="ui visible error message">
              { create_error_message }
            </div>
          </div>
        </div>
      </div>
  </div>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';

    //email login
    this.signin = () => {
      firebase.auth().signInWithEmailAndPassword(this.refs.email.value, this.refs.password.value).then(
        () => {
          console.log("signin success!");
          route('/viewrecipe');
        },
        (error) => {
          if(error.code == 'auth/invalid-email'){ //代表的なやつだけ
            this.auth_error_message = 'メールアドレスの形式が正しくありません';
          } else if(error.code == 'auth/wrong-password') {
            this.auth_error_message = 'メールアドレスかパスワードか正しくありません';
          } else if(error.code == 'auth/user-not-found') {
            this.auth_error_message = 'ユーザーが見つかりません';
          } else {
            this.auth_error_message = error.message;
          }
        console.log(error);
          this.update();
        }
      )
    }

    //google
    const provider = new firebase.auth.GoogleAuthProvider();
    this.googleAuth = () => {
      console.log("ログイン");
      firebase.auth().signInWithPopup(provider).then((result) => {
        const user = result.user;
        window.userData = user;
        const textRef = firebase.database().ref(`/account/${user.uid}`);
        textRef.update({
          displayName : user.displayName
        });
        route('/viewrecipe');
        $('.ui.modal#login').modal('hide');
      }).catch( (error) => {
        // エラー処理 errorはオブジェクト
        route('/viewrecipe');
        console.log(error);
      });
    };

    this.signupModal = () => {
      $(`.ui.modal.signup`).modal('show');
    };

    this.signup = () => {
      if (this.refs.newpassword.value === this.refs.newpasswordR.value){
        firebase.auth().createUserWithEmailAndPassword(this.refs.newemail.value, this.refs.newpassword.value).then(
          () => {
              console.log("signup success!")
              $(`.ui.modal.signup`).modal('hide');
              route('/viewrecipe');
          },
          (error) => {
            if(error.code == 'auth/invalid-email') { //代表的なやつだけ
              this.create_error_message = 'メールアドレスの形式が正しくありません';
            } else if(error.code == 'auth/weak-password') {
              this.create_error_message = 'パスワードは6文字以上必要です';
            } else if(error.code == 'auth/email-already-in-use') {
              this.create_error_message = 'そのメールアドレスは既に使用されています'
            } else {
              this.create_error_message = error.message;
            }
              console.log(error)
          }
        )
      } else {
        this.create_error_message = 'パスワードが正しくありません'
      }
      this.update();
    }



  </script>

  <style>

  </style>

</app-auth>
