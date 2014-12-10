module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'




  grunt.initConfig
    coffee_jshint:
      options:
        globals: ['after', 'afterEach', 'before', 'beforeEach', 'describe', 'it', 'expect', 'sinon', 'location', 'module']
      src: ['source/javascripts/**/*.coffee', 'Gruntfile.coffee']
    jshint:
      options:
        globals: ['after', 'afterEach', 'before', 'beforeEach', 'describe', 'it', 'expect', 'sinon', 'location', 'module']
      src: ['source/javascripts/**/*.js']
    exec:
      styleguide:
        command: 'bundle exec middleman build'
    kss:
      dist:
        options:
          includeType: 'css'
          includePath: 'build/stylesheets/all.css'
        files:
          'styleguide/': 'source/stylesheets/'
    connect:
      styleguide:
        options:
          port: 9000
          # keepalive: true
          livereload: true
          base: 'styleguide/'
    esteWatch:
      options:
        dirs: ['source/stylesheets/**/']
        livereload:
          enabled: true
          extensions: ['sass', 'scss', 'md']
          port: 35729
      sass: (filepath) ->
        return ['exec:styleguide', 'kss:dist']
      scss: (filepath) ->
        return ['exec:styleguide', 'kss:dist']
      md: (filepath) ->
        return ['kss:dist']




  for t of pkg.devDependencies
    if t.substring(0, 6) is 'grunt-'
      grunt.loadNpmTasks t
  grunt.registerTask 'dev-styleguide', 'Watch and connect styleguide files', ['connect:styleguide', 'esteWatch:styleguide']
  grunt.registerTask 'script', 'Run lint and test for script files.', ['jshint', 'coffee_jshint']
  grunt.registerTask 'styleguide', 'Create style guide.', ['exec:styleguide', 'kss:dist']
