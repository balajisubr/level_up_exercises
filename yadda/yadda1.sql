CREATE SEQUENCE yadda.brewer_id_seq;

CREATE SEQUENCE yadda.address_id_seq;

CREATE TABLE yadda.addresses(
id integer NOT NULL DEFAULT nextval('yadda.address_id_seq'),
created_on timestamp DEFAULT current_timestamp,
updated_on timestamp DEFAULT current_timestamp,
created_by varchar(20),
updated_by varchar(20),
number integer NOT NULL,
street varchar(40) NOT NULL,
city varchar(30) NOT NULL,
region varchar(30) NOT NULL,
country varchar(30) NOT NULL,
PRIMARY KEY(id)
)
;

CREATE SEQUENCE yadda.brewer_id_seq;

CREATE TABLE yadda.brewers(
id integer NOT NULL DEFAULT nextval('yadda.brewer_id_seq'),
created_on timestamp DEFAULT current_timestamp,
updated_on timestamp DEFAULT current_timestamp,
created_by varchar(20),
updated_by varchar(20),
name varchar(40) NOT NULL,
address_id integer REFERENCES yadda.addresses(id),
description text,
founding_year smallint,
PRIMARY KEY(id)
);

CREATE SEQUENCE yadda.style_id_seq;
CREATE TABLE yadda.beer_styles(
id integer NOT NULL DEFAULT nextval('yadda.style_id_seq'),
style varchar(20) NOT NULL,
description text,
PRIMARY KEY(id)
);

CREATE SEQUENCE yadda.beer_id_seq;
CREATE TABLE yadda.beers(
id integer NOT NULL DEFAULT nextval('yadda.beer_id_seq'),
created_on timestamp DEFAULT current_timestamp,
updated_on timestamp DEFAULT current_timestamp,
created_by varchar(20),
updated_by varchar(20),
style_id integer references yadda.beer_styles(id),
description text,
brewing_year smallint,
brewer_id INT references yadda.brewers(id),
PRIMARY KEY(id)
);

CREATE SEQUENCE yadda.country_id_seq;
CREATE TABLE yadda.countries(
  id integer NOT NULL DEFAULT nextval('yadda.country_id_seq'),
  name varchar(40) NOT NULL,
  PRIMARY KEY(id)
);

CREATE SEQUENCE yadda.user_id_seq;
CREATE TABLE yadda.users(
id integer NOT NULL DEFAULT nextval('yadda.user_id_seq'),
created_on timestamp DEFAULT current_timestamp,
updated_on timestamp DEFAULT current_timestamp,
created_by varchar(20),
updated_by varchar(20),
first_name varchar(40),
middle_name varchar(40),
last_name varchar(40),
country_id smallint REFERENCES yadda.countries(id),  
uuid integer UNIQUE,
preferences varchar(40) array,
PRIMARY KEY(id) 
);

CREATE SEQUENCE yadda.rating_id_seq;
CREATE TABLE yadda.ratings(
id integer NOT NULL DEFAULT nextval('yadda.rating_id_seq'),
beer_id integer REFERENCES yadda.beers(id),
created_on timestamp DEFAULT current_timestamp,
updated_on timestamp DEFAULT current_timestamp,
created_by varchar(20),
updated_by varchar(20),
user_id int REFERENCES yadda.users(id),
look smallint,
feel smallint,
taste smallint,
smell smallint
);










