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
        // mask: '**/*.js',
        reportFormats: ['lcov']
      }
    },
    validation: {
      options: {
        remotePath: 'http://localhost:4567/',
        remoteFiles: ['/'], // remoteFiles: ['mycategory/test2.html'], みたいにする
        reset: true,
        stoponeerror: false,
        relaxerror: ['A meta element with an http-equiv attribute whose value is X-UA-Compatible must have a content attribute with the value IE=edge.'],
      },
      files: {
        src: ['*.html'] // ここはいじらない
      }
    },
    esteWatch: {
      options: {
        dirs: ['source/**/']
      },
      js: function(filepath) {
        var r = []
        if(filepath.match(/source\/javascripts/) || filepath.match(/source\/tests/)) {
          var filename = filepath.match(".+/(.+?)([\?#;].*)?$")[1];
          var dirpath = filepath.match("^(.*/).*$");
          grunt.config(['jshint', 'src'], filepath)
          r.push('jshint');
          if(filepath.match(/source\/tests\/mocha/)) {
            grunt.config(['mocha_istanbul', 'src'], dirpath);
            grunt.config(['mocha_istanbul', 'options', 'mask'], filename);
            r.push('mocha_istanbul');
          }
          if(filepath.match(/source\/tests\/casperjs/)) {
            grunt.config(['casperjs', 'files'], filepath);
            r.push('casperjs');
          }
        }
        return r;
      },
      slim: function(filepath) {
        if(filepath.match("source\/")) {
          grunt.config(['validation', 'options', 'remoteFiles'], [RegExp.rightContext.replace(/.slim/, '')]);
          return ['validation']
        }
      },
      erb: function(filepath) {
        if(filepath.match("source\/")) {
          grunt.config(['validation', 'options', 'remoteFiles'], [RegExp.rightContext.replace(/.erb/, '')]);
          return ['validation']
        }
      }
    }
  });




  for (t in pkg.devDependencies) {
    if (t.substring(0, 6) === 'grunt-') {
      grunt.loadNpmTasks(t);
    }
  }




  grunt.registerTask('watch', 'watch source files', ['esteWatch'])
  grunt.registerTask('test', 'test script files', ['casperjs', 'mocha_istanbul'])
};
