import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Variadic {
    static function main() {
        program
          .version('0.0.1')
          .command('rmdir <dir> [otherDirs...]')
          .action(function (dir:String, otherDirs:Array<String>) {
            console.log('rmdir %s', dir);
            if (otherDirs.length > 0) {
              for (oDir in otherDirs) {
                console.log('rmdir %s', oDir);
              }
            }
          });

        program.parse(process.argv);
    }
}
