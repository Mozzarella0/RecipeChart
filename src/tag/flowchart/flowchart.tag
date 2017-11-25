<flowchart>
  <div class="ui container">
    <div each="{ i, key in opts.chartData }" class="outside">
      <div class="{ key.processName }">
        <i>{ key.content }</i>
      </div>
    </div>
  </div>


  <script>

  </script>

  <style>
    .outside {
      position: relative;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      width: 190px;
      height: 50px;
      margin: auto;
    }

    .terminal {
      width: 200px;
      height: 50px;
      color: white;
      background-color: #333333;
      border-radius: 20px;
      text-align: center;
      margin: auto;
      margin-top: 20px;
    }

    .process {
      width: 190px;
      height: 50px;
      color: white;
      background-color: #333333;
      text-align: center;
      margin: auto;
      margin-top: 20px;
    }

    .decision {
      width: 0;
      height: 0;
      border-top: 25px solid transparent;
      border-right: 100px solid #333333;
      border-bottom: 25px solid transparent;
      border-left: 0 solid transparent;
      margin-top: 20px;
    }

    .decision:after {
      content: '';
      position: absolute;
      top: 0;
      bottom: 0;
      left: 100px;
      width: 0;
      height: 0;
      margin: auto 0;
      border-top: 25px solid transparent;
      border-right: 0 solid transparent;
      border-bottom: 25px solid transparent;
      border-left: 100px solid #333333;
    }

    .decision i {
      position: absolute;
      top: -75px;
      left: 0;
      width: 200px;
      height: 200px;
      line-height: 200px;
      text-align: center;
      color: #fff;
      z-index: 1;
    }

    .inout {
      width: 180px;
    	height: 50px;
      margin: auto;
      margin-top: 20px;
      text-align: center;
    }

    .inout i {
      color: #fff;
      z-index: 1;
    }

    .inout::before {
      content: '';
      position: absolute;
      top: 0;
      bottom: 0;
      right: 0;
      left: 0;
      background: #333333;
      z-index: -1;
      transform: skew(-20deg);
    }

    .loop-s {
      width: 190px;
      height: 25px;
      background-color: #333333;
      margin: auto;
      margin-top: 45px;
    }

    .loop-s:after{
      content: '';
      position: absolute;
      top: -50px;
      bottom: 0;
      width: 190px;
      height: 50px;
      border-bottom: 25px solid #333333;
    	border-left: 25px solid transparent;
    	border-right: 25px solid transparent;
    }

    .loop-s i {
      position: absolute;
      top: -100px;
      left: 0;
      width: 200px;
      height: 200px;
      line-height: 200px;
      text-align: center;
      color: #fff;
      z-index: 1;
    }

    .loop-e {
      width: 190px;
      height: 25px;
      background-color: #333333;
      margin: auto;
      margin-top: 20px;
    }

    .loop-e:after{
      content: '';
      position: absolute;
      top: 25px;
      bottom: 0;
      width: 190px;
      height: 50px;
      border-top: 25px solid #333333;
    	border-left: 25px solid transparent;
    	border-right: 25px solid transparent;
    }

    .loop-e i {
      position: absolute;
      top: -100px;
      left: 0;
      width: 200px;
      height: 200px;
      line-height: 200px;
      text-align: center;
      color: #fff;
      z-index: 1;
    }
  </style>

</flowchart>
