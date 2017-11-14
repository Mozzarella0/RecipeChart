<flowchart>

  <div class="container">
    <div each="{ index, data in chartData}" class="outside">
      <div class="{ data.class }">
        <i>{ data.value }</i>
      </div>
    </div>
  </div>


  <script>
    this.chartData = {};
    const row = opts.text.split(';');

    console.log(row);
    for (let i=0; i < row.length - 1; i++) {
      const obj = {};
      const gr = row[i].split('=');
      console.log(gr);
      obj.class = gr[0];
      obj.value = gr[1];
      this.chartData[i] = obj;
      console.log(this.chartData);
    }

  </script>

  <style>

    .outside {
      position: relative;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      width: 200px;
      height: 50px;
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

    .loop-start {


    }

    .loop-end {


    }
  </style>

</flowchart>
