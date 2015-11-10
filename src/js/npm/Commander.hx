package js.npm;

import js.npm.commander.Command;

@:jsRequire("commander")
extern class Commander {
    static var root(get,never):Command;
    private inline static function get_root():Command return cast Commander;
}
