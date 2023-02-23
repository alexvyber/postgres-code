-- create sample table

CREATE TABLE t_tags( 
	id serial PRIMARY KEY,
	tag text UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()	
);

-- insert some sample data

INSERT INTO t_tags (tag) values
('Pen'),
('Pencil');

-- Lets view the data

SELECT * FROM t_tags;

-- 2020-12-29 19:13:19.392095

-- Lets insert a record, on conflict do noting

INSERT INTO t_tags (tag) 
VALUES ('Pen')
ON CONFLICT (tag) 
DO 
	NOTHING;


SELECT * FROM t_tags;



-- Lets insert a record, on conflict set new values

INSERT INTO t_tags (tag) 
VALUES ('Pen')
ON CONFLICT (tag) 
DO 
	UPDATE SET
		tag = EXCLUDED.tag || '1',
		update_date = NOW();