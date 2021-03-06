import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Examples {
    static function main() {
        program
          .version('0.0.1')
          .option('-C, --chdir <path>', 'change the working directory')
          .option('-c, --config <path>', 'set config path. defaults to ./deploy.conf')
          .option('-T, --no-tests', 'ignore test hook');

        program
          .command('setup [env]')
          .description('run setup commands for all envs')
          .option("-s, --setup_mode [mode]", "Which setup mode to use")
          .action(function(env, options:js.npm.commander.Command){
            var mode = if (options.setup_mode == null) "normal" else options.setup_mode;
            if (env == null) env = 'all';
            console.log('setup for %s env(s) with %s mode', env, mode);
          });

        program
          .command('exec <cmd>')
          .alias('ex')
          .description('execute the given remote cmd')
          .option("-e, --exec_mode <mode>", "Which exec mode to use")
          .action(function(cmd, options){
            console.log('exec "%s" using %s mode', cmd, options.exec_mode);
          }).on('--help', function() {
            console.log('  Examples:');
            console.log();
            console.log('    $ deploy exec sequential');
            console.log('    $ deploy exec async');
            console.log();
          });

        program
          .command('*')
          .action(function(env){
            console.log('deploying "%s"', env);
          });

        program.parse(process.argv);
    }
}
