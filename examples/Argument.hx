import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Argument {
    static function main() {
        var cmdValue, envValue;
        program
          .version('0.0.1')
          .arguments('<cmd> [env]')
          .action(function (cmd, env) {
             cmdValue = cmd;
             envValue = env;
          });

        program.parse(process.argv);

        if (cmdValue == null) {
           console.error('no command given!');
           process.exit(1);
        }
        console.log('command:', cmdValue);
        console.log('environment:', if (envValue != null) envValue else "no environment given");
    }
}
