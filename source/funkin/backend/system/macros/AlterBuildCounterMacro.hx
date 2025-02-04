package funkin.backend.system.macros;

#if !macro
import haxe.macro.Expr.Field;
import haxe.macro.Context;
#end
#if sys
import sys.io.File;
#end

/**
 * Macro that loads the current build number from `ATbuildnumber.txt`, then makes it available as an integer.
 * 
 * `ATbuildnumber.txt` is automatically incremented when the engine is launched with `lime test windows`.
 */
class AlterBuildCounterMacro {
    /**
     * Returns the obtained build number.
     */
    public static macro function getATBuildNumber():haxe.macro.Expr.ExprOf<Int> {
		var ATbuildNum:Int = Std.parseInt(File.getContent("ATbuildnumber.txt"));
        #if !display
        // return macro $v{ATbuildNum+1};
		return macro $v{ATbuildNum};
        #else
        return macro $v{0};
        #end
    }
}