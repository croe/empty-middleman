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
        coverageFolder: 'source/tests/coverage/mocha'
        mask: '**/*/.js',
        reportFormats: ['lcov']
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
          grunt.config 'casperjs.files', [filepath]
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
          grunt.config 'mocha_istanbul.src', filepath
          return 'mocha_istanbul'
        }
      }
    }
  });




  for (t in pkg.devDependencies) {
    if (t.substring(0, 6) === 'grunt-') {
      grunt.loadNpmTasks(t);
    }
  }




  grunt.registerTask('watch', 'watch source files', ['esteWatch:casperjs', 'esteWatch:mocha']);
};
