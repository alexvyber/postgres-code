CREATE OR REPLACE FUNCTION pivotcode (
	tablename VARCHAR,
	myrow VARCHAR,
	mycol VARCHAR,
	mycell VARCHAR,
	celldatatype VARCHAR
)
RETURNS VARCHAR
LANGUAGE PLPGSQL AS
$$
	DECLARE
		
		dynsql1 VARCHAR;
		dynsql2 VARCHAR;
		columnlist VARCHAR;
		
	BEGIN
		
		-- 1 retrive list of all DISTINCT column name
			
			-- SELECT DISTINCT(column_name) FROM table_name
			
			dynsql1 = 'SELECT STRING_AGG(DISTINCT ''_''||'||mycol||'||'' '||celldatatype||''','','' ORDER BY ''_''||'||mycol||'||'' '||celldatatype||''') FROM '||tablename||';';
		
			EXECUTE dynsql1 INTO columnlist;
			
		-- 2. setup the crosstab query 
			
		dynsql2 = 'SELECT * FROM crosstab (
		 ''SELECT '||myrow||','||mycol||','||mycell||' FROM '||tablename||' GROUP BY 1,2 ORDER BY 1,2'',
		 ''SELECT DISTINCT '||mycol||' FROM '||tablename||' ORDER BY 1''
	 	)
	 	AS newtable (
		 '||myrow||' VARCHAR,'||columnlist||'
		 );';
					
		-- 3. return the query
	
		RETURN dynsql2;
		
	END
$$