var gulp   = require('gulp');
var gutil  = require('gulp-util');
var coffee = require('gulp-coffee');
var exec   = require('gulp-exec');
var rename = require('gulp-rename');
var del = require('del');

var config = {
  watchers: {
    index: '*.coffee',
    files: 'src/**/*.coffee'
  },
  index: {src: 'index.ios.coffee', dist: './'},
  files: {src: 'src/**/*.coffee', dist: './dist'}
}

gulp.task('clean', function(cb) {
  del([ './dist/**/*'  ], cb);
})

gulp.task('build', ['clean'], function() {
  var options = {
    continueOnError: false, // default = false, true means don't emit error event
    pipeStdout: true
  };

  gulp.src(config.files.src)
    .pipe(exec('cjsx-transform <%= file.path %>', options))
    .pipe(rename(function (path) {
      path.extname = '.js';
    }))
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(config.files.dist));
});

gulp.task('cjsx', ['build'], function() {
  var options = {
    continueOnError: false, // default = false, true means don't emit error event
  	pipeStdout: true
  };

  gulp.src(config.index.src)
    .pipe(exec('cjsx-transform <%= file.path %>', options))
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(config.index.dist));
});

gulp.task('watch', ['cjsx'], function() {
  gulp.watch([config.watchers.index, config.watchers.files], ['cjsx']);
});

gulp.task('default', ['watch']);
