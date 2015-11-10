import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class SubCommands {
    static function main() {
        program
          .version('0.0.1')
          .command('install [name]', 'install one or more packages')
          .command('search [query]', 'search with optional query')
          .command('list', 'list packages installed', {isDefault: true})
          .parse(process.argv);
    }
}
