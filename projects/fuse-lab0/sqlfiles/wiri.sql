DROP SCHEMA IF EXISTS fusedemo;
CREATE SCHEMA fusedemo;



CREATE TABLE fusedemo.Conversation (
  coninput VARCHAR(50) NOT NULL,
  conresponse VARCHAR(250) NOT NULL,
  PRIMARY KEY (coninput)
);



INSERT INTO fusedemo.Conversation(coninput, conresponse) VALUES ('hi','Hello');
INSERT INTO fusedemo.Conversation(coninput, conresponse) VALUES ('how are you','so so');
