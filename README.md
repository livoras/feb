FEB
=======================

FEB stands for front-end boilerplate.

FEB is a boileroplate let you easily create front-end project and organize its structure for you and make you start coding fast. It provides basic gulp tasks. 

FEB is using ES6 and ReactJS by default.

## Tools

**Build System**

* [Gulp](http://gulpjs.com/) - Front-end task runner and build system.

**Preprocessor**

* [Babel](https://babeljs.io/) - JavaScript ES6 preprocessor.
* [Less](http://lesscss.org/) - CSS preprocessor.

**Modular Development**

* [Browserify](http://browserify.org/) - A super powerful module system.

**Testing**

* [Mocha](http://mochajs.org/) - TDD/BDD test framework.
* [Sinon](http://sinonjs.org/) - Spy and data mocking.
* [Chai](http://chaijs.com/) - Assertions library.

## Basic Usage

**NOTE**: It assumes that Node.js and NPM have been installed in your system.

Install global dependencies,

    $ npm install -g browserify gulp-cli babel

install feb command-line tool: 

    $ npm install -g feb-cli 

create a project using command-line tool and installl dependencies:

    $ feb new hello-feb
    $ cd hello-feb && npm install

finally, just fly:

    $ gulp

and then open your browser to load `http://localhost:8080/` and change source codes of `src`.

## How it works

After running the `gulp` command, things will happen:

1. **Copy HTML**: HTML files directly placed in `src` will be copied into `bin`.
2. **Compile Scripts** : ES6 files directly placed in `src/scripts` will be compiled to ES5 JS files which will be placed in `bin/scripts`. But note that files placed in subfolders of `src/scripts` won't be compiled but they can and should be required by 'entry' JavaScript files placed directly in `src/scripts` through Browserify.
3. **Compile Less**: Less files placed in `src/stylsheets` will be compiled to CSS files which will be placed in `bin/stylesheets`. Just like JavaScript, only 'naked' Less files will be compiled.
4. **Copy libraries and static resources**: Copy `lib/`, `assets/` folder and all their contents into `bin/`.
5. **Testing**: Specs in `test/specs` will be run and results will be shown in terminal.
6. **Watch changes and livereload**: Files's changes in `src` will make gulp rerun tasks above. And if you start a local server and open your broswer to load pages in `bin/`, changes will trigger automatic refresh of browser if you have the `LiveReload` plugin installed in your [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)/[Firefox](https://addons.mozilla.org/zh-CN/firefox/addon/livereload/).

You can read `gulpfile.babel.js` for more details.

## Distribution

Use:

    $ gulp build

to build and minify all stuff. A `dist` folder will be created and ready for distribution.

## Examples

TODO

## License

The MIT License (MIT)

Copyright (c) 2015 Livoras

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

