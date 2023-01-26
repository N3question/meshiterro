const { environment } = require('@rails/webpacker')

module.exports = environment


// Bootstrapを導入
// yarnでインストールする方法を選択
// NEXT app/javascriptの配下にstylesheetsフォルダを作成 
// => 作成したフォルダの配下にapplication.scssファイルを作成 => そのファイルを開く
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)