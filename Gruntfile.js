  module.exports = function(grunt) {




  var pkg, t;
  pkg = grunt.file.readJSON('package.json');




  grunt.initConfig({
    casperjs: {
      options: {
        async: {
          parallel: true
        }
      },
      files: ['source/tests/casperjs/**/*.js']
    },
    jshint: {
      options: {
        globals: ['console']
      },
      src: ['source/javascripts/**/*.js', 'Gruntfile.js']
    },
    mocha_istanbul: {
      src: 'source/tests/mocha',
      options: {
        coverageFolder: 'source/tests/coverage/mocha',
        mask: '**/*/.js',
        reportFormats: ['lcov']
      }
    },
    validation: {
      options: {
        remotePath: 'http://localhost:4567/',
        remoteFiles: ['/'], // remoteFiles: ['mycategory/test2.html'], みたいな
        reset: true,
        stoponeerror: false,
        relaxerror: ['A meta element with an http-equiv attribute whose value is X-UA-Compatible must have a content attribute with the value IE=edge.'],
        reportpath: 'html-validation-report.json'
      },
      files: {
        src: ['*.html'] // ここはいじらない
      }
    },
    esteWatch: {
      casperjs: {
        options: {
          dirs: ['source/tests/casperjs/**/*.js'],
          livereload: {
            enabled: true,
            extensions: ['js'],
            port: 35729
          }
        },
        js: function(filepath) {
          grunt.config(['casperjs.files'], [filepath])
          return 'casperjs'
        }
      },
      mocha: {
        options: {
          dirs: ['source/tests/mocha/**/*.js'],
          livereload: {
            enabled: true,
            extensions: ['js'],
            port: 35730
          }
        },
        js: function(filepath) {
          grunt.config(['mocha_istanbul.src'], [filepath])
          return 'mocha_istanbul'
        }
      } // 正規表現で更新したページだけlocalhost:4567上でバリデートするようにする
      // },
      // validation: {
      //   options: {
      //     dirs: ['source/**/*.slim'],
      //     livereload: {
      //       enabled: true,
      //       extensions: ['slim'],
      //       port: 35731
      //     }
      //   },
      //   slim: function(filepath) {
      //     grunt.config(['mocha_istanbul.src'], [filepath])
      //     return 'validation'
      //   }
      // }
    }
  });




  for (t in pkg.devDependencies) {
    if (t.substring(0, 6) === 'grunt-') {
      grunt.loadNpmTasks(t);
    }
  }




  grunt.registerTask('watch', 'watch source files', ['esteWatch:casperjs', 'esteWatch:mocha'])
  grunt.registerTask('test', 'test script files', ['casperjs', 'mocha_istanbul'])
};
