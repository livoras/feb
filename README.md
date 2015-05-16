FEB(Front-End-Boilerplate)
================================

Simple front-end development workflow. You can use it for a fast and smooth kick-off of a front-end project or configurate it to your own workflow farther.

New version FEB uses [Gulp](http://gulpjs.com/) for build system. And old version FEB which leverages on [Grunt](http://gruntjs.com/) can be found [here](https://github.com/livoras/feb/tree/grunt).

## Included Tools

It includes

**Build System**

* [Gulp](http://gulpjs.com/) - Front-end task runner and build system.

**Testing**

* [Mocha](http://mochajs.org/) - TDD/BDD test framework.
* [Sinon](http://sinonjs.org/) - Spy and data mocking.
* [Chai](http://chaijs.com/) - Assertions library.

**Preprocessor**

* [CoffeeScript](http://coffeescript.org/) - JavaScript preprocessor.
* [Less](http://lesscss.org/) - CSS preprocessor.

**Modular Development**

* [Browserify](http://browserify.org/) - A super powerful module system.

## Basic Usage

**NOTE**: It assumes that Node.js and NPM have been installed in your system.

Install global dependencies,

```
$ npm install -g browserify gulp
```

Clone project and install development dependencies,

```
$ git clone https://github.com/livoras/feb.git
$ cd feb
$ npm install
```

Then just fly,

```
$ gulp
```

and open your browser to load `http://localhost:8080/bin/index.html` and change source codes of `src`.

## How it works

After running the `gulp` command, things will happen:

1. **Copy HTML**: HTML files directly placed in `src` will be copied into `bin`.
2. **Compile CoffeeSctipt** : CoffeeScript files directly placed in `src/scripts` will be compiled to JS files which will be placed in `bin/scripts`. But note that files placed in subfolders of `src/scripts` won't be compiled but they can and should be required by 'entry' CoffeeScript placed directly in `src/scripts` through Browserify.
3. **Compile Less**: Less files placed in `src/stylsheets` will be compiled to CSS files which will be placed in `bin/stylesheets`. Just like CoffeeScrtipt, only 'naked' Less files will be compiled.
4. **Copy libraries and static resources**: Copy `lib/`, `assets/` folder and all their contents into `bin/`.
5. **Testing**: Specs in `test/specs` will be run and results will be shown in terminal.
6. **Watch changes and livereload**: Files's changes in `src` will make gulp rerun tasks above. And if you start a local server and open your broswer to load pages in `bin/`, changes will trigger automatic refresh of browser if you have the `LiveReload` plugin installed in your [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)/[Firefox](https://addons.mozilla.org/zh-CN/firefox/addon/livereload/).


## Distribution

Use

```
$ gulp build
```

to bulid and minify all stuff. A `dist` folder will be created and ready for distribution.

## Examples

TODO

## License

Released under the [MIT license](https://tldrlegal.com/license/mit-license).
