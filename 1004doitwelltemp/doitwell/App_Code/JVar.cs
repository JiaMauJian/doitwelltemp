using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Json Var
/// </summary>
public enum JVar : int
{
    //Json Object
    NONE = -1,
    JFAIL = 0,
    JRTN_MSG = 1,
    JDATA_OBJ = 2,
    JDATA_GRID = 3,
    JDATA_TABLE = 4
}