package js.npm.commander;

@:jsRequire("commander", "Option")
extern class Option {
    var flags:String;
    var required:Bool; // these are not really bools, but rather integers
    var optional:Bool; // that are either zero or non-zero, so bool checks work
    var bool:Bool;
    var short:String;
    var long:String;
    var description:String;
    function new(flags:String, ?description:String);
}
