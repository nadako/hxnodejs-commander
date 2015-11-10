import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Coercion {
    static function main() {
        function range(val, _) {
          return val.split('..').map(Std.parseInt);
        }

        function list(val, _) {
          return val.split(',');
        }

        function collect(val, memo) {
          memo.push(val);
          return memo;
        }

        function increaseVerbosity(v, total) {
          return total + 1;
        }

        program
          .version('0.0.1')
          .usage('[options] <file ...>')
          .option('-i, --integer <n>', 'An integer argument', function(val,_) return Std.parseInt(val))
          .option('-f, --float <n>', 'A float argument', function(val,_) return Std.parseFloat(val))
          .option('-r, --range <a>..<b>', 'A range', range)
          .option('-l, --list <items>', 'A list', list)
          .option('-o, --optional [value]', 'An optional value')
          .option('-c, --collect [value]', 'A repeatable value', collect, [])
          .option('-v, --verbose', 'A value that can be increased', increaseVerbosity, 0)
          .parse(process.argv);

        console.log(' int: %j', program.integer);
        console.log(' float: %j', program.float);
        console.log(' optional: %j', program.optional);
        if (program.range == null)
            program.range = [];
        console.log(' range: %j..%j', program.range[0], program.range[1]);
        console.log(' list: %j', program.list);
        console.log(' collect: %j', program.collect);
        console.log(' verbosity: %j', program.verbose);
        console.log(' args: %j', program.args);
    }
}
