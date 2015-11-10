import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class CustomHelp {
    static function main() {
        program
          .version('0.0.1')
          .option('-f, --foo', 'enable some foo')
          .option('-b, --bar', 'enable some bar')
          .option('-B, --baz', 'enable some baz');

        // must be before .parse() since
        // node's emit() is immediate

        program.on('--help', function(){
          console.log('  Examples:');
          console.log('');
          console.log('    $ custom-help --help');
          console.log('    $ custom-help -h');
          console.log('');
        });

        program.parse(process.argv);

        console.log('stuff');
    }
}
