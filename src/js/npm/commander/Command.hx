package js.npm.commander;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

@:jsRequire("commander", "Command")
extern class Command extends EventEmitter<Command> implements Dynamic<Dynamic> {
    var commands:Array<Command>;
    var options:Array<Option>;
    function new(name:String);
    function command(name:String, ?desc:String, ?opts:CommandOpts):Command;
    function arguments(desc:String):Command;
    function parseExpectedArgs(desc:String):Command;
    function action(fn:Function):Command;

    @:overload(function<T>(flags:String, description:String, ?defaultValue:T):Command {})
    @:overload(function<T>(flags:String, description:String, regexp:js.RegExp, ?defaultValue:T):Command {})
    function option<T>(flags:String, description:String, fn:String->T->T, ?defaultValue:T):Command;

    function allowUnknownOption(?arg:Bool):Command;
    function parse(argv:Array<String>):Command;
    function parseOptions(argv:Array<String>):{args:Array<String>, unknown:Array<String>};
    function opts():Dynamic<Dynamic>;

    @:overload(function():String {})
    function version(str:String, ?flags:String):Command;

    @:overload(function():String {})
    function description(str:String):Command;

    @:overload(function():String {})
    function alias(str:String):Command;

    @:overload(function():String {})
    function usage(str:String):Command;

    function name():String;
    function outputHelp(?cb:String->String):Void;
    function help(?cb:String->String):Void;
}

typedef CommandOpts = {
    @:optional var isDefault:Bool;
    @:optional var noHelp:Bool;
}
