const path = require('path');
const webpack = require('webpack');

module.exports = {
  // エントリーポイント(始める場所)
  entry: './src/main.js',
  // 出力されるファイルの名前をどうするか、どこへ吐き出すか
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'public/javascripts')
  },
  // コンパイル設定
  module: {
    rules: [
      // riotコンパイラ
      {
        enforce: 'pre',
        test: /\.tag$/,
        exclude: /node_modules/,
        use: [{
          loader: 'riotjs-loader',
          options: {
            type: 'none'
          }
        }],
      },
      // babelコンパイラ
      {
        test: /\.(tag|js)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['es2015-riot']
        }
      }
    ]
  },
  devtool: 'source-map',
  // プラグイン(コンパイル後のファイルを最適化)
  plugins: [
    // ファイルを圧縮する。
    new webpack.optimize.UglifyJsPlugin({
      sourceMap: true
    }),
    // 公式の自慢
    new webpack.optimize.ModuleConcatenationPlugin(),
    // 使用頻度の高いモジュールほど名前が短くなる
    new webpack.optimize.OccurrenceOrderPlugin(),
    // 圧縮された奴をさらに圧縮するやつ
    new webpack.optimize.AggressiveMergingPlugin(),
    // グローバル変数を設定する
    new webpack.ProvidePlugin({
      riot: 'riot'
    })
  ]
};
