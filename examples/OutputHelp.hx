import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class OutputHelp {
    static function main() {
        program
          .version('0.0.1')
          .command('getstream [url]', 'get stream URL')
          .parse(process.argv);

          if (process.argv.slice(2).length == 0) {
            function make_red(txt) return 'RED ALERT: $txt';
            program.outputHelp(make_red);
          }
    }
}
