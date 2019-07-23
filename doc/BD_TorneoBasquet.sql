
-- Derby
--asadmin create-jdbc-connection-pool --restype java.sql.Driver --driverclassname org.apache.derby.jdbc.EmbeddedDriver --property "url=jdbc\\:derby\\:basquetball" derbySqlPool
-- MySQL
--asadmin create-jdbc-connection-pool --restype javax.sql.DataSource --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --property "user=basquetball:password=basquetball:url=jdbc\\:mysql\\://localhost\\:3306/basquetball" mySqlPool
--asadmin create-jdbc-resource --connectionpoolid derbySqlPool jdbc/basquetball

/*
 * MySQL
 */
CREATE TABLE equipos (
  idEquipo           INT NOT NULL AUTO_INCREMENT,
  nombre             VARCHAR(50) NOT NULL,
  logotipo           VARCHAR(100) NOT NULL,
  color_primario     VARCHAR(10) NOT NULL,
  color_secundario   VARCHAR(10) NOT NULL,
  PRIMARY KEY (idEquipo)
);

CREATE TABLE jugadores (
  idJugador          INT NOT NULL AUTO_INCREMENT,
  idEquipo           INT NOT NULL,
  nombre             VARCHAR(50) NOT NULL,
  direccion          VARCHAR(100) NOT NULL,
  fecha_nacimiento   DATE NOT NULL,
  foto               VARCHAR(100) NOT NULL,
  FOREIGN KEY (idEquipo) REFERENCES equipos (idEquipo),
  PRIMARY KEY (idJugador)
);

CREATE TABLE partidos (
  idPartido            INT NOT NULL AUTO_INCREMENT,
  equipo_local         INT NOT NULL,
  equipo_visitante     INT NOT NULL,
  Estatus              VARCHAR(50) NOT NULL,
  marcador_global      INT NOT NULL,
  marcador_visitante   INT NOT NULL,
  fecha                DATETIME NOT NULL,
  PRIMARY KEY (idPartido),
  FOREIGN KEY (equipo_local) REFERENCES equipos (idEquipo),
  FOREIGN KEY (equipo_visitante) REFERENCES equipos (idEquipo),
  UNIQUE (equipo_local,equipo_visitante,fecha)
);

CREATE TABLE usuarios (
  idUsuario           INT NOT NULL AUTO_INCREMENT,
  nombre              VARCHAR(50) NOT NULL,
  login               VARCHAR(50) NOT NULL,
  password            VARCHAR(50) NOT NULL,
  email               VARCHAR(50) NOT NULL,
  estadoDeRegistro   BOOLEAN NOT NULL,
  PRIMARY KEY (idUsuario)
);

CREATE TABLE bitacoras (
  idBitacora int(11) NOT NULL AUTO_INCREMENT,
  idUsuario int(11) DEFAULT NULL,
  url varchar(50) DEFAULT NULL,
  fecha datetime NOT NULL,
  PRIMARY KEY (idBitacora),
  FOREIGN KEY (idUsuario) REFERENCES usuarios (idUsuario)
 );