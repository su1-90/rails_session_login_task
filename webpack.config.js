const path = require('path');

module.exports = {
  entry: './src/index.js', // エントリーポイント
  output: {
    path: path.resolve(__dirname, 'dist'), // 出力ディレクトリ
    filename: 'bundle.js', // 出力ファイル名
  },
  mode: 'production',
  module: {
    rules: [
      {
        test: /\.js$/, // JavaScriptファイルに適用
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader', // Babelを使用
        },
      },
    ],
  },
  resolve: {
    extensions: ['.js'],
  },
};
