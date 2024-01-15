
-- keepcoding.alumnos definition
-- Drop table
-- DROP TABLE keepcoding.alumnos;
CREATE TABLE keepcoding.alumnos (
	id int8 NOT NULL,
	"name" varchar NOT NULL,
	surename varchar NOT NULL,
	document_id varchar NOT NULL,
	birthdate date NOT NULL,
	CONSTRAINT alumnos_pk PRIMARY KEY (id)
);

--======================================================================================================================================================

-- keepcoding.bootcamp definition
-- Drop table
-- DROP TABLE keepcoding.bootcamp;
CREATE TABLE keepcoding.bootcamp (
	id int8 NOT NULL,
	detalle varchar NOT NULL,
	CONSTRAINT bootcamp_pk PRIMARY KEY (id)
);

--======================================================================================================================================================

-- keepcoding.alumno_bootcamp definition
-- Drop table
-- DROP TABLE keepcoding.alumno_bootcamp;
CREATE TABLE keepcoding.alumno_bootcamp (
	id int8 NOT NULL,
	id_alumno int8 NOT NULL,
	id_bootcamp int8 NOT NULL,
	CONSTRAINT alumno_bootcamp_pk PRIMARY KEY (id)
);

-- keepcoding.alumno_bootcamp foreign keys
ALTER TABLE keepcoding.alumno_bootcamp ADD CONSTRAINT alumno_bootcamp_alumno_fk FOREIGN KEY (id_alumno) REFERENCES keepcoding.alumnos(id);
ALTER TABLE keepcoding.alumno_bootcamp ADD CONSTRAINT alumno_bootcamp_bootcamp_fk FOREIGN KEY (id_bootcamp) REFERENCES keepcoding.bootcamp(id);

--======================================================================================================================================================

-- keepcoding.profesor definition
-- Drop table
-- DROP TABLE keepcoding.profesor;
CREATE TABLE keepcoding.profesor (
	id int8 NOT NULL,
	"name" varchar NOT NULL,
	surename varchar NOT NULL,
	CONSTRAINT profesor_pk PRIMARY KEY (id)
);

--======================================================================================================================================================

-- keepcoding.profesor_bootcamp definition
-- Drop table
-- DROP TABLE keepcoding.profesor_bootcamp;
CREATE TABLE keepcoding.profesor_bootcamp (
	id int8 NOT NULL,
	id_profesor int8 NOT NULL,
	id_bootcamp int8 NOT NULL,
	CONSTRAINT profesor_bootcamp_pk PRIMARY KEY (id)
);


-- keepcoding.profesor_bootcamp foreign keys
ALTER TABLE keepcoding.profesor_bootcamp ADD CONSTRAINT profesor_bootcamp_bootcamp_fk FOREIGN KEY (id_bootcamp) REFERENCES keepcoding.bootcamp(id);
ALTER TABLE keepcoding.profesor_bootcamp ADD CONSTRAINT profesor_bootcamp_profesir_fk FOREIGN KEY (id_profesor) REFERENCES keepcoding.profesor(id);

--======================================================================================================================================================

-- keepcoding.modulo definition
-- Drop table
-- DROP TABLE keepcoding.modulo;
CREATE TABLE keepcoding.modulo (
	id int8 NOT NULL,
	id_bootcamp int8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT modulo_pk PRIMARY KEY (id)
);

-- keepcoding.modulo foreign keys
ALTER TABLE keepcoding.modulo ADD CONSTRAINT modulo_fk FOREIGN KEY (id_bootcamp) REFERENCES keepcoding.bootcamp(id);

--======================================================================================================================================================

--INSERTS

--Alumnos
INSERT INTO keepcoding.alumnos (id, "name", surename, document_id, birthdate) VALUES(1, 'Carlos', 'Perez', '29249079', '1981-11-11');
INSERT INTO keepcoding.alumnos (id, "name", surename, document_id, birthdate) VALUES(2, 'Leonardo', 'Britez', '34098765', '1982-01-13');

--bootcamp
INSERT INTO keepcoding.bootcamp (id, detalle) VALUES(1, 'Inteligencia Artificial');
INSERT INTO keepcoding.bootcamp (id, detalle) VALUES(2, 'Big Data & Datamining');
INSERT INTO keepcoding.bootcamp (id, detalle) VALUES(3, 'Programacion Orientada a Objetos');

--alumno_bootcamp
INSERT INTO keepcoding.alumno_bootcamp (id, id_alumno, id_bootcamp) VALUES(1, 1, 1);
INSERT INTO keepcoding.alumno_bootcamp (id, id_alumno, id_bootcamp) VALUES(2, 1, 3);
INSERT INTO keepcoding.alumno_bootcamp (id, id_alumno, id_bootcamp) VALUES(3, 2, 2);
INSERT INTO keepcoding.alumno_bootcamp (id, id_alumno, id_bootcamp) VALUES(4, 2, 3);

--profesor
INSERT INTO keepcoding.profesor (id, "name", surename) VALUES(1, 'Juan', 'Perez');
INSERT INTO keepcoding.profesor (id, "name", surename) VALUES(2, 'Pedro', 'Gonzalez');

--profesor_bootcamp
INSERT INTO keepcoding.profesor_bootcamp (id, id_profesor, id_bootcamp) VALUES(1, 1, 1);
INSERT INTO keepcoding.profesor_bootcamp (id, id_profesor, id_bootcamp) VALUES(2, 1, 2);
INSERT INTO keepcoding.profesor_bootcamp (id, id_profesor, id_bootcamp) VALUES(3, 2, 3);
INSERT INTO keepcoding.profesor_bootcamp (id, id_profesor, id_bootcamp) VALUES(4, 2, 2);

--modulo
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(1, 1, 'Python - Introduccion a Pandas');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(2, 1, 'Python - Introduccion a Numpy');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(3, 1, 'Python - Programacion Funcional');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(4, 1, 'Base de Datos - Posgress');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(5, 1, 'Big Query');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(6, 2, 'Programacion en Java');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(7, 2, 'Data Warehouse');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(8, 2, 'Bases de Datos - NoSQL');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(9, 2, 'Base de Datos - Posgress');
INSERT INTO keepcoding.modulo (id, id_bootcamp, "name") VALUES(10, 2, 'Big Query');