module.exports = function (grunt) {

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-shell');

    grunt.initConfig({
        watch: {
            ruby: {
                tasks: ['shell:test'],
                files: [
                    '**/*.rb',
                ]
            }
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

    grunt.registerTask('default', ['shell', 'watch']);
};
