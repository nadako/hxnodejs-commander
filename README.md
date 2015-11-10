# Haxe/hxnodejs externs for the [commander](https://www.npmjs.com/package/commander) NPM module

For `commander` version: **2.9.0**

[![Build Status](https://travis-ci.org/nadako/hxnodejs-commander.svg)](https://travis-ci.org/nadako/hxnodejs-commander)

It is really simple and usage is quite similar to the original JavaScript API:

```haxe
import js.Node.process;
import js.Node.console;
import js.npm.Commander.root as program;

class Intro {
    static function main() {
        program
          .version('0.0.1')
          .option('-p, --peppers', 'Add peppers')
          .option('-P, --pineapple', 'Add pineapple')
          .option('-b, --bbq-sauce', 'Add bbq sauce')
          .option('-c, --cheese [type]', 'Add the specified type of cheese [marble]', 'marble')
          .parse(process.argv);

        console.log('you ordered a pizza with:');
        if (program.peppers) console.log('  - peppers');
        if (program.pineapple) console.log('  - pineapple');
        if (program.bbqSauce) console.log('  - bbq');
        console.log('  - %s cheese', program.cheese);
    }
}
```

See more examples in the `examples` directory.
