module.exports = function (grunt) {

    grunt.loadNpmTasks('grunt-este-watch');

    grunt.initConfig({
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
                return ['netnotify'];
            }
        },
        netnotify: {
            options: {
                addr: '0.0.0.0',
                port: 12345
            }
        }
    });

    ///

    var net = require('net');
    var clients = [];

    grunt.registerTask('netnotify', function() {

        var options = this.options({
            addr: '127.0.0.1',
            port: 12345
        });

        if (this.flags.init)
        {
            net.createServer(function (socket) {

                var name = socket.remoteAddress + ":" + socket.remotePort;

                socket.on('end', function () {
                    clients.splice(clients.indexOf(socket), 1);
                    grunt.log.writeln("netnotify disconnect... " + name);
                });

                clients.push(socket);
                grunt.log.writeln("netnotify connect ... " + name);

            }).listen(options.port, options.addr);

            grunt.log.writeln("netnotify listen ... " + options.addr + ":" + options.port + " port");
        }
        else
        {
            grunt.log.writeln("netnotify notify ... " + clients.length + " clients");

            clients.forEach(function (client) {
                client.write("x\n");
            });
        }
    });

    grunt.registerTask('default', ['netnotify:init', 'esteWatch']);
};
