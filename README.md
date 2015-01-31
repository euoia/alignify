Alignify
--------
A vim plugin to align text.

Aligns the selected range based on an (optional) delimiter.  
If the column position is not provided, it defaults to 35.  
If the delimiter if not provided, it defaults to '='.  

To use, select a range and:
```
:call Alignify()          - Aligns to column 35 on "=".
:call Alignify(20)        - Aligns to column 20 on "=".
:call Alignify(50, ":")   - Aligns to column 50 on ":".
```


License
-------
MIT.
