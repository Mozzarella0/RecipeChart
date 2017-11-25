<app-home>
  <div class="fixing">
    <div class="home">
      <div class="container">
        <div class="title">
          <p>RecipeChart</p>
        </div>
        <div class="about">
          <span>Cooking on the flowchart.</span>
        </div>

      </div>
    </div>
  </div>

  <script>
    if(opts.userData){
      console.log(opts.userData);
      // route('/recipehome');
    }
  </script>

  <style>
    .home {
      background-image: url("./img/title.jpg");
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      position: relative;
      height: 100%;
      top: -100px;
    }

    .title {
      font-family: 'Teko', sans-serif;
      font-size: 150px;
      -webkit-text-stroke-width: 2px;
      -webkit-text-stroke-color: #FFF;
      color: rgba(0,0,0,0);
      position: relative;
      top: 100px;
    }

    .about {
      position: relative;
      top: 150px;
    }

    .about span{
      font-family: 'Teko', sans-serif;
      font-size: 40px;
      color: white;
    }

  </style>

</app-home>
