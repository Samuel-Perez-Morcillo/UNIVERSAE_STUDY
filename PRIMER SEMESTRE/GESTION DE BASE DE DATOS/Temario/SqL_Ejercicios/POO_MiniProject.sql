
Type T_TIENDA dropped.


Type T_PRODUCTOS dropped.


Type T_PRODUCTO dropped.


Error starting at line : 6 in command -
DROP TYPE t_empleados FORCE
Error report -
ORA-04043: object T_EMPLEADOS does not exist

https://docs.oracle.com/error-help/db/ora-04043/04043. 00000 -  "Object %s does not exist."
*Cause:    An object name was specified that was not recognized by the system.
           There are several possible causes:
           - An invalid name for a table, view, sequence, procedure, function,
           package, or package body was entered. Since the system could not
           recognize the invalid name, it responded with the message that
           the named object did not exist.
           - An attempt was made to rename an index, cluster, or some
           other object that cannot be renamed.
*Action:   Check the spelling of the named object and rerun the code. Valid
           names of tables, views, functions and other database objects can
           be listed by querying the data dictionary.

Type T_PRODUCTO compiled


Type Body T_PRODUCTO compiled


Type T_PRODUCTOS compiled


Type T_TIENDA compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
0/0       PL/SQL: Compilation unit analysis terminated
4/15      PLS-00201: identifier 'T_EMPLEADOS' must be declared
Errors: check compiler log

Type Body T_TIENDA compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
49/9      PLS-00103: Encountered the symbol "TOTAL_PRODUCTOS_IVA" when expecting one of the following:     if 
Errors: check compiler log
