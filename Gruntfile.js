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
      src: ['source/javascripts/**/*.js']
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
          // TODO: 更新したファイルにだけタスクを適用するように変更したい
          return ['casperjs'];
        }
      }
    }
  });




  for (t in pkg.devDependencies) {
    if (t.substring(0, 6) === 'grunt-') {
      grunt.loadNpmTasks(t);
    }
  }




  grunt.registerTask('watch', 'watch source files', ['esteWatch:casperjs']);
};
