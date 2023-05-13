package com.sanvalero.Dao;


import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import static com.sanvalero.Util.constants.*;
import static com.sanvalero.Util.constants.Password;

public class Database {
    public static Jdbi jdbi;
    public static Handle db;

    public static void connect(){
        jdbi= Jdbi.create(databaseURL,Username,Password);
        jdbi.installPlugin(new SqlObjectPlugin());
        db= jdbi.open();
    }

    public static void close(){
        db.close();

    }
}