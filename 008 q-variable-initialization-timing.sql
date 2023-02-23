DO
$$
	DECLARE
		start_time time:= NOW();
	BEGIN
		RAISE NOTICE 'Starting at %s: ',start_time;
		PERFORM pg_sleep(2);
		RAISE NOTICE 'Next time %s: ',start_time;
		
	END;
$$	
LANGUAGE plpgsql;