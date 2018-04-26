const webpack = require("webpack");
const resolve = require("path").resolve;
const merge = require("webpack-merge");
const CopyWebpackPlugin = require("copy-webpack-plugin");

const common = env => {
  return {
    context: resolve(__dirname, "src"),

    resolve: {
      extensions: [".js", ".scss"]
    },

    output: {
      filename: "bundle.js",
      path: resolve(__dirname, "dist"),
      publicPath: "/"
    },

    devtool: "inline-source-map",

    module: {
      rules: [
        {
          test: /\.scss$/i,
          use: ["style-loader", "css-loader?modules", "sass-loader"]
        },
        {
          test: /\.(png|svg|jpg|gif)$/i,
          use: ["file-loader"]
        }
      ]
    }
  };
};

const devSrvPort = 8000;

module.exports = function(env) {
  return merge(
    common(env),
    env === "dev"
      ? {
          mode: "development",

          entry: [
            "react-hot-loader/patch",
            "webpack-dev-server/client?http://localhost:" + devSrvPort,
            "webpack/hot/only-dev-server",
            "./index.bs"
          ],

          devServer: {
            hot: true,
            port: devSrvPort,
            open: true,
            contentBase: resolve(__dirname, "public"),
            publicPath: "/"
          },

          plugins: [
            new webpack.HotModuleReplacementPlugin(),
            new webpack.NamedModulesPlugin()
          ]
        }
      : {
          mode: "production",

          entry: ["./index.bs"],

          plugins: [
            new CopyWebpackPlugin([
              {
                from: "../public"
              }
            ]),
            new webpack.LoaderOptionsPlugin({
              minimize: true,
              debug: false
            }),
            new webpack.DefinePlugin({
              "process.env": {
                NODE_ENV: JSON.stringify("production")
              }
            }),
            new webpack.optimize.UglifyJsPlugin({
              beautify: false,
              comments: false
            })
          ]
        }
  );
};
