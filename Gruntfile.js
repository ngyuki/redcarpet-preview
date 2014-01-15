module.exports = function (grunt) {

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-este-watch');
    grunt.loadNpmTasks('grunt-shell');

    grunt.loadTasks('tasks/');

    grunt.initConfig({
        watch: {
            ruby: {
                tasks: ['remoteTask:test'],
                files: [
                    '**/*.rb',
                ],
                options: {
                    spawn: false,
                },
            },
        },
        esteWatch: {
            options: {
                dirs: [
                    '.',
                    'lib/**/',
                    'test/**/'
                ],
                livereload: {
                    enabled: false,
                },
            },
            rb: function (filepath) {
                return ['remoteTask:test'];
            }
        },
        remoteTask: {
            options: {
                addr: '0.0.0.0',
                port: 12345,
                sshEnv: true
            },
            test: ['shell:test']
        },
        shell: {
            test: {
                options: {
                    stdout: true,
                    stderr: true
                },
                command: 'bundle exec rake test TESTOPTS="--use-color"'
            }
        }
    });

    grunt.registerTask('default', ['remoteTask:listen', 'watch']);
    grunt.registerTask('wait', ['remoteTask:wait']);
};
