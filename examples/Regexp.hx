import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Regexp {
    static function main() {
      program
        .version('0.0.1')
        .option('-s --size <size>', 'Pizza size', new js.RegExp("^(large|medium|small)$", "i"), 'medium')
        .option('-d --drink [drink]', 'Drink', new js.RegExp("^(coke|pepsi|izze)$", "i"))
        .parse(process.argv);

      console.log(' size: %j', program.size);
      console.log(' drink: %j', program.drink);
    }
}
