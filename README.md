# jiketao-frontend（极客淘前端）


## 技术堆栈
* PureCSS - 前端UI框架
* ReactJS
* Browserify - 前端模块化工具
* Gulp - 工作流构建
* LessCSS - CSS预处理
* ES6
* Mocha + SinonJS + ChaiJS - TDD

## 目录结构

```
.
├── README.md
├── assets
│   └── chair.jpg
├── bin
│   ├── assets 
│   │   └── chair.jpg
│   ├── index.html
│   ├── scripts
│   │   └── home.js
│   └── styles
│       └── home.css
├── dist
│   ├── assets
│   │   └── chair.jpg
│   ├── index.html
│   ├── scripts
│   │   └── home.js
│   └── styles
│       └── home.css
├── gulpfile.js
├── lib
├── package.json
└── src
    ├── index.html
    ├── scripts
    │   ├── common
    │   │   └── util.js
    │   ├── components
    │   │   └── product.js
    │   └── home.js
    └── styles
        ├── common
        │   └── muicell.less
        └── home.less

```

* `src`存放源码，包括HTML，Less，JS，编译后会对应存放到`bin`目录下。

* HTML直接存放在`src`根目录下，每个页面对应一个HTML文件。

* JS存放在`src/scripts`目录下，直接存放在该目录下的JS文件会被当作是入口模块，直接被Browserify所编译。而子目录中的JS文件不会被编译，只能被当作依赖模块。一般来说，一个HTML对应一个JS入口模块。该目录下`components`存放的是React组件；`common`存放的是一些全局共用模块。

* Less存放在`src/styles`目录下，直接存放在该目录下的Less文件会被当作是入口样式，被LessCSS所编译。而子目录下的Less文件不会被编译。一般来说，一个HTML对应一个Less入口样式。该目录下的`common`目录存放一些公用的样式。

* `lib`目录存放第三方类库，一些过大的类库在编译阶段可能由于过大的原因导致编译过慢，可以用`<script>`在HTML引入。

* `assets`存放字体和图片等静态资源。

* `dist`存放可以准备发布的编译测试好的文件。

* 编译时，`lib`和`assets`都会被直接复制到目标目录（`bin`或者`dist`）。

## 编译开发

* 安装依赖`npm install`。
* 安装 [LiveReload](http://livereload.com/)浏览器插件。
* 运行`gulp`。
* 打开浏览器`http://localhost:8080`，该链接指向`bin`根目录，可以访问改目录下的HTML文件。
* 点击`LivoeReload`插件激活，然后修改`src`目录的源码，浏览器会自动刷新。


## 发布构建
运行：

```
gulp build
```

会生成`dist`目录，改目录下会有相应的编译、压缩好的HTML，CSS，JS。

## 测试（TDD）
TODO