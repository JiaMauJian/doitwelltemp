using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Text;
using System.Diagnostics;

/// <summary>
/// Summary description for MySqlInsert
/// </summary>
public class MySqlUpdate
{
    private Hashtable _args = new Hashtable();
    string _table;

    /// <summary>
    /// Constructs Insert object
    /// </summary>
    /// <param name="table">table name to insert to</param>
    public MySqlUpdate(string table)
    {
        this._table = table;
    }

    /// <summary>
    /// Adds item to Insert object
    /// </summary>
    /// <param name="name">item name</param>
    /// <param name="val">item value</param>
    public void Add(string name, object val)
    {
        _args.Add(name, val);
    }

    /// <summary>
    /// Removes item from Insert object
    /// </summary>
    /// <param name="name">item name</param>
    public void Remove(string name)
    {
        try
        {
            _args.Remove(name);
        }
        catch
        {
            throw (new Exception("No such item"));
        }
    }

    /// <summary>
    /// Test representatnion of the Insert object (SQL query)
    /// </summary>
    /// <returns>System.String</returns>
    public override string ToString()
    {
        StringBuilder s1 = new StringBuilder();

        IDictionaryEnumerator enumInterface = _args.GetEnumerator();
        while (enumInterface.MoveNext())
        {
            if (enumInterface.Value != null)
            {
                s1.Append(enumInterface.Key.ToString() + "=" + "'" + enumInterface.Value.ToString() + "',");        
            }
        }

        return "update " + _table + " set " + s1.ToString().Substring(0, s1.ToString().Length-1);
    }

    /// <summary>
    /// Gets or sets item into Insert object
    /// </summary>
    object this[string key]
    {
        get
        {
            Debug.Assert(_args.Contains(key), "Key not found");
            return _args[key];
        }
        set { _args[key] = value; }
    }
}