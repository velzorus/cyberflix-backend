drop database if exists BD_CYBERFLIX;
create database BD_CYBERFLIX;
use BD_CYBERFLIX;

CREATE TABLE tb_pais (
id_pais INT AUTO_INCREMENT PRIMARY KEY,
nom_pais VARCHAR(99)
);

CREATE TABLE tb_genero (
id_genero INT AUTO_INCREMENT PRIMARY KEY,
nom_gen VARCHAR(255)
);

CREATE TABLE tb_director (
id_director INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
fecha_nacimiento DATE,
id_pais int,
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_actor (
id_actor INT AUTO_INCREMENT PRIMARY KEY,
nom_actor VARCHAR(255)
);

CREATE TABLE tb_administrador (
id_admin INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
correo_electronico VARCHAR(255) UNIQUE NOT NULL,
contrasena VARCHAR(255) NOT NULL,
direccion VARCHAR(255) NOT NULL,
id_pais int,
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_pelicula (
id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(255),
descripcion VARCHAR(499),
anio INT,
duracion INT,
productora VARCHAR(255),
idioma VARCHAR(99),
trailer VARCHAR(400),
video VARCHAR(400),
imagen VARCHAR(255),
servidor VARCHAR(99),
id_genero INT,
id_director INT,
id_pais INT,
id_actor INT,
FOREIGN KEY (id_genero) REFERENCES tb_genero(id_genero),
FOREIGN KEY (id_director) REFERENCES tb_director(id_director),
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais),
FOREIGN KEY (id_actor) REFERENCES tb_actor(id_actor)
);

CREATE TABLE tb_usuario (
id_usu INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
email VARCHAR(255) UNIQUE,
contrasena VARCHAR(255),
avatar VARCHAR(255)
);

CREATE TABLE tb_comentario (
id_comentario INT AUTO_INCREMENT PRIMARY KEY,
comentario VARCHAR(255),
id_usu INT,
id_pelicula INT,
FOREIGN KEY (id_usu) REFERENCES tb_usuario(id_usu),
FOREIGN KEY (id_pelicula) REFERENCES tb_pelicula(id_pelicula)
);

INSERT INTO tb_genero (nom_gen) VALUES
('Acción, Aventura, Comedia'),
('Drama, Ciencia ficción, Terror'),
('Romance, Fantasía, Animación'),
('Documental, Misterio, Crimen'),
('Historia, Musical, Suspense'),
('Thriller, Guerra'),
('Biografía, Deporte'),
('Acción, Drama'),
('Comedia, Romántica'),
('Aventura, Fantasía, Animación');

INSERT INTO tb_pais (nom_pais) VALUES
('Estados Unidos'),('Canadá'),('Reino Unido'),('Alemania'),('Francia'),('Japón'),('Australia'),('Brasil'),('China'),
('India'),('México'),('Italia'),('España'),('Argentina'),('Rusia'),('Corea del Sur'),('Sudáfrica'),('Colombia'),('Chile'),
('Egipto'),('Perú'),('Canadá'),('Nueva Zelanda'),('Países Bajos'),('Portugal'),('Suiza'),('Suecia'),('Noruega'),('Grecia'),
('Irlanda'),('Singapur');

INSERT INTO tb_actor (nom_actor) VALUES
('John Smith, Alice Johnson, Michael Brown, Ava DuVernay'),
('Emily Davis, Robert Wilson'),
('Luis Pérez, Juan González, Lucas Rodríguez'),
('Julian Martínez, John Alex Johnson'),
('Tom Cruise, Nicole Kidman, Brad Pitt'),
('Jennifer Aniston, Matt LeBlanc, Courteney Cox'),
('Leonardo DiCaprio, Kate Winslet'),
('Meryl Streep, Denzel Washington, Julia Roberts'),
('Robert De Niro, Al Pacino, Joe Pesci'),
('Scarlett Johansson, Chris Evans, Mark Ruffalo');

INSERT INTO tb_director (nombre, fecha_nacimiento, id_pais) VALUES
('James Cameron', '1954-08-16', 1),
('Steven Spielberg', '1946-12-18', 2),
('Christopher Nolan', '1970-07-30', 3),
('Quentin Tarantino', '1963-03-27', 4),
('Martin Scorsese', '1942-11-17', 5),
('Ridley Scott', '1937-11-30', 6),
('Greta Gerwig', '1983-08-04', 7),
('Bong Joon-ho', '1969-09-14', 8),
('Pedro Almodóvar', '1949-09-25', 9),
('Denis Villeneuve', '1967-10-03', 10),
('Wes Anderson', '1969-05-01', 11),
('Jordan Peele', '1979-02-21', 12),
('Taika Waititi', '1975-08-16', 13),
('Patty Jenkins', '1971-07-24', 14),
('Chloé Zhao', '1982-03-31', 15),
('Ava DuVernay', '1972-08-24', 16),
('Gus Van Sant', '1952-07-24', 17),
('Spike Lee', '1957-03-20', 18),
('Alfonso Cuarón', '1961-11-28', 19),
('David Fincher', '1962-08-28', 20);

INSERT INTO tb_pelicula (titulo, descripcion, anio, duracion, productora, idioma, trailer, video, imagen, servidor, id_genero, id_director, id_pais, id_actor) VALUES
('Avengers: Endgame', 'Los superhéroes de Marvel se unen para enfrentar al villano Thanos y restaurar el equilibrio en el universo.', 2019, 181, 'Marvel Studios', 'Español Latino', 'https://www.youtube.com/embed/znk2OICHbjY?si=_JGScI1F98kY03SY', 'https://mega.nz/embed/qzJnlASD#cjW2_YeEm7b4qhKApTYfGK5yyNxPv30L2nrGWkRRKig', 'c1442dbb-2407-40e1-accb-0e9b6d5310ae_avengers.jpg', 'Mega', 1, 7, 6, 1),
('The Godfather', 'La historia de la familia Corleone, una de las familias de crimen organizado más poderosas de Nueva York.', 1972, 175, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/gCVj1LeYnsc?si=u4JQeOX76WvvFGD8', 'https://mega.nz/embed/SrBggSiC#yjzO1aEQGTSyi-R6KjW8h4v3NT9WjSPoeUsJQs27lK8', 'b727f523-c253-45bb-bd13-40895c86c718_godfather.jpg', 'Mega', 3, 7, 11, 3),
('Forrest Gump', 'La vida de Forrest Gump, un hombre con un coeficiente intelectual bajo, pero con una gran influencia en los eventos históricos.', 1994, 142, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/Cyh1LpxnaxI?si=EzUViWQqCd_m8hzp', 'https://mega.nz/embed/f3QBCAoK#HjKG5fdwBbkC3csu-VQO4vgQ9EGF_GgllZHA58DtolA', '1bf8c44a-629b-468a-85de-c99f39f4f51f_gump.jpg', 'Mega', 2, 2, 2, 2),
('ONE PIECE: La Isla del Cielo', 'Especial de televisión que resume los hechos que tuvieron lugar en la Isla del Cielo', 2018, 142, 'Toei Animation', 'Español Latino', 'https://www.youtube.com/embed/-DIkSvT-zD4?si=m3SmCsZleEXnpnGK', 'https://www.yourupload.com/embed/lNA6AJlgLX7l', '5ca76dea-6ed3-49ea-b7e2-1cf75ecab6b3_skypiea.jpg', 'YourUpload', 2, 2, 2, 2),
('Dragon Ball Super: Broly', 'Goku y Vegeta encuentran a Broly, un guerrero Saiyajin. Pero, ¿cómo sobrevivió a la destrucción de su planeta y dónde estuvo todo ese tiempo?.', 2018, 142, 'Toei Animation', 'Español Latino', 'https://www.youtube.com/embed/dl3w10VVQj8?si=5UjNygW-JUjiSpR-', 'https://archive.org/embed/dragon-ball-super-broly', '21398c95-fa93-40e4-94fc-e3098442f78b_broly.png', 'Archive.org', 1, 2, 2, 2),
('Scooby-Doo conoce a Coraje', 'Scooby-Doo y sus amigos descubren un objeto extraño en medio de Nowhere, Kansas, el pueblo de Coraje y sus dueños.', 2021, 120, 'Warner Bros.', 'Español Latino', 'https://www.youtube.com/embed/5pBHLRTHBT8?si=I6SRgJxi3z_GlSpH', 'https://www.yourupload.com/embed/fFM22VKbVUN7', '00a84e48-bc58-4024-827f-aa3b47c784be_coraje.jpg', 'YourUpload', 4, 2, 3, 5),
('Nowhere', 'Mia, una joven embarazada, escapa de un país en guerra escondiéndose en un contenedor marítimo a bordo de un carguero. Tras una violenta tormenta, Mia da a luz mientras está perdida en el mar, donde debe luchar por sobrevivir.', 2023, 140, 'Netflix Studios', 'Español Latino', 'https://www.youtube.com/embed/QNnsE06aBSU?si=MU6f3OLq6K_2Owu3', 'https://www.yourupload.com/embed/8842dsQ41Twp', '7a027725-66c1-480a-894f-1ed6bdde2f00_nowhere.jpg', 'YourUpload', 3, 4, 2, 5),
('El protector', 'Un agente de protección de testigos descubre que hay corrupción en el departamento y que debe proteger a una joven.', 1996 , 130, 'Hollywood', 'Español Latino', 'https://www.youtube.com/embed/cauMtxavBMU?si=9GLWYunrxnuJtFPl', 'https://www.yourupload.com/embed/KUIiD4n7euJQ', 'c7a8970f-bb2a-4c65-a559-bb3f74e2764d_protector.jpg', 'YourUpload', 4, 2, 1, 3),
('La maldición', 'El doctor Marrow es especialista en trastornos del sueño. Para realizar un experimento, pide la colaboración de varios de sus pacientes. Así pues, todos ellos se trasladan a una antigua y solitaria mansión para llevar a cabo el estudio.', 1999, 130, 'DreamWorks', 'Español Latino', 'https://www.youtube.com/embed/J4fWI5J4bEU?si=q_gAIGc1n95yiaRJ', 'https://www.yourupload.com/embed/XRNvyuLnJQPm', 'bb3dc36b-8b45-45e7-a86f-1c943b7c795b_maldicion.jpg', 'YourUpload', 2, 3, 1, 4),
('La traviesa hada de los dientes', 'Maxie, una niña de 12 años, conoce a Violet, un hada de los dientes avariciosa que se ha perdido en el mundo de los humanos. Finalmente, Violet accede a ayudar a Maxie a viajar hasta la casa de su abuela, en el campo.', 2022, 110, 'Seru animation', 'Español Latino', 'https://www.youtube.com/embed/duq3qAsyvfg?si=bHGSIjENv_acfdPZ', 'https://www.yourupload.com/embed/Qx0csdk72uwl', '0087875d-6b5d-46cf-b1d8-63997529c354_hada.jpg', 'YourUpload', 4, 3, 1, 4),
('Fuerzas especiales', 'La periodista Elsa Casanova es secuestrada por un jefe militar en Afganistán y un grupo de soldados franceses de las fuerzas especiales de elite son enviados a su rescate.', 2011, 140, 'Filmin', 'Español Latino', 'https://www.youtube.com/embed/hpaGKkroHP4?si=CUxxiBgVFc-aqLlV', 'https://www.yourupload.com/embed/rWx74i7ijR2C', '1ee26b7c-2fb9-47a8-9d9f-b9c3f8c26d27_fuerzas.jpg', 'YourUpload', 2, 3, 2, 4),
('Monsters University', 'En sus días universitarios, la feroz rivalidad entre Mike Wazowski y Sulley provoca que ambos sean expulsados del Programa de Sustos de la Universidad de Monstruos.', 2001, 220, 'Pixar, Walt Disney Pictures', 'Español Latino', 'https://www.youtube.com/embed/6-hRvF7suLM?si=2EsyiSWqW56emtzx', 'https://www.yourupload.com/embed/8i4xy3Myfu06', '5eab5e74-80f1-4143-bad8-01e161c34179_monsters.jpeg', 'YourUpload', 1, 4, 5, 2),
('Monsters, Inc', 'Monsters, Incorporated es la fábrica de sustos más grande en el mundo de los monstruos y James P. Sullivan es uno de sus mejores asustadores. Sullivan es un monstruo grande e intimidante de piel azul con grandes manchas color púrpura y cuernos.', 2013, 220, 'Pixar, Walt Disney Pictures', 'Ingles', 'https://www.youtube.com/embed/uzkkh-1A_kY?si=lhC2uuv3AM0TpCWT', 'https://www.yourupload.com/embed/020UK3DC3Q6o', '26b2736e-64cb-46bf-8434-87877e066025_inc.jpg', 'YourUpload', 2, 3, 4, 2),
('Mickey: Dulce o truco', 'Mickey, Minnie, Goofy, Donald y Daisy están pidiendo dulces cuando Donald espía una mansión espeluznante y supone que tiene las mejores delicias. Después de convencer a sus amigos, el dueño lanza un hechizo que los convierte en sus disfraces.', 2023 , 21, 'Walt Disney Pictures', 'Español Latino', 'https://www.youtube.com/embed/uhjMD2-uj5c?si=AboeMz4Cdksh8lR8', 'https://www.yourupload.com/embed/02B663Gnh4EO', '4e1c0202-8f07-4372-9122-29b637b5a926_mickey.jpeg', 'Fireload', 1, 5, 3, 1),
('Misión Imposible - Sentencia mortal', 'Ethan debe detener a una inteligencia artificial que todas las potencias mundiales codician, la cual se ha vuelto tan poderosa que se rebeló contra sus creadores y ahora es una amenaza en sí misma.', 2023 , 190, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/3kM40dT0WdY?si=vwfAwLNTjHDku4YS', 'https://www.yourupload.com/embed/R70Xy2860cuc', 'cdd10b9a-730e-4bfd-945f-cf8ce0bdc896_mision.jpg', 'YourUpload', 6, 7, 4, 5),
('Subterráneo', 'Maxime es un joven quebequense que trabaja en una mina de oro. Tras provocar un drama que casi acaba con la vida de su amigo de la infancia, vive con un sentimiento de culpa que le prohíbe alcanzar la felicidad.', 2023, 160, 'Bravo Charlie', 'Español Latino', 'https://www.youtube.com/embed/al-WDTq2WxA?si=eV43Z9C4Lb8LeITU', 'https://www.yourupload.com/embed/8L1q8rfpkLfd', 'd977246f-e815-4098-8832-176a66db5826_souterrain.jpg', 'YourUpload', 7, 6, 5, 6),
('La Serpiente Blanca', 'Un día, una joven llamada Blanca es salvada por Xuan, un cazador de serpientes de un pueblo cercano. Dado que la muchacha ha perdido la memoria, deciden emprender juntos un viaje para descubrir su verdadera identidad, llegando a desarrollar sentimientos profundos el uno por el otro a lo largo del camino.', 2019, 160, ' Warner Bros', 'Español Latino', 'https://www.youtube.com/embed/WUDLX3dzZ6A?si=jcQlFTcVdSipeI4w', 'https://www.yourupload.com/embed/ihu8j4b3OdeR', '47d61cee-3737-4cf7-8f82-b922f2f0fb69_white.jpg', 'YourUpload', 5, 4, 5, 6),
('El despertar del diablo 2', 'Unos caníbales mutantes atacan a un grupo de soldados de la Guardia Nacional que investigan una señal en el desierto de Nuevo México.', 2007, 140, 'The Hills Have', 'Español Latino', 'https://www.youtube.com/embed/GUCGHn3c5gM?si=kEmSzY4nS2miXun6', 'https://www.yourupload.com/embed/5kKG2h1B5Ot2', '6fb6a74d-0cdc-4fc9-8423-a7ec39337c4b_devil.jpeg', 'YourUpload', 6, 4, 5, 6),
('Dragon Ball Una Aventura Mística', 'Dragon Ball Makafushigi Daibōken es la 3ª película basada en la serie de manga y anime Dragon Ball estrenada el 9 de julio de 1988', 1988, 150, 'Toei Animation', 'Español Latino', 'https://www.youtube.com/embed/sHo-bEc1TFo?si=L-R_udyEZM6G4q3X', 'https://www.yourupload.com/embed/llHXJoWtq56H', '78a9ba34-4837-4df6-a399-e84449107d10_mistica.jpg', 'YourUpload', 5, 6, 6, 6),
('Patch Adams', 'Basada en una historia real, la película es la biografía del médico Patch Adams, quien revolucionó la comunidad médica oficial aplicando singulares terapias', 1998, 190, 'Universal Studios', 'Español Latino', 'https://www.youtube.com/embed/BZuZGSme9_I?si=y76pEXskfTthGr_p', 'https://www.yourupload.com/embed/J24klnkxto61', '2387505e-ebc7-4448-a11c-811e682e8b5f_adams.jpg', 'YourUpload', 3, 6, 5, 6),
('La última puerta', 'Un comerciante de libros raros es contratado por un adinerado coleccionista para hallar dos tomos cuyo autor es Satanás.', 2000, 213, 'Araba Films, Kino Vision', 'Español Latino', 'https://www.youtube.com/embed/6QdBiSIgtg4?si=tgBCTLDh0vMt3ioa', 'https://www.yourupload.com/embed/TQSi7WUW2m31', 'd94a7a01-3baf-42dd-a82f-bfd6f10844ef_puerta.jpg', 'YourUpload', 6, 7, 5, 6);

INSERT INTO tb_usuario (nombre, email, contrasena, avatar) VALUES
('Anna Maria Schmidt', 'anna@example.com', '$2a$10$8wY6MCWP6pJ3Cc820Fzsm.NgHUZHSIsgboQaXlPZqW5I3gRokMv9m', 'avatar1.jpg'), -- contrasena1
('Andreas Müller Schmitt', 'andreas@example.com', '$2a$10$45d0CKY1tlpcFKQLkyQSxOvHiGEiLqb02nUtUowrHDK52DKTVp5IO', 'avatar2.jpg'), -- contrasena2
('Sophie Dupont Martin', 'sophie@example.com', '$2a$10$8JA2iXF7mmucKLwsvHbxG.4.3pCjJCkIebiLHtpA5ZqWnqMoaJCvK', 'avatar3.jpg'), -- contrasena3
('Pierre Leclerc Dubois', 'pierre@example.com', '$2a$10$1rc.LeWCOKIVMFkUTorBD.nsor1BMw4wrWmzFVCsXy.aSmCfYSdjG', 'avatar4.jpg'), -- contrasena4
('Elena Russo Ferrari', 'elena@example.com', '$2a$10$RwB9UtbBren7IYP5Wk/JnO98Ig0R.8xbFEO9j2odUrTlVhdZeFbr2', 'avatar5.jpg'); -- contrasena5

INSERT INTO tb_administrador(nombre, apellido, correo_electronico, contrasena, direccion, id_pais) VALUES ("Victor", "Quispe", "victor@admin.com","$2a$10$opnwdk0e/kn8VKLkI9e94eNEevArCmPE5aYasdymQPoyEPa5Mfh92", "456 Pine St", 1); -- admin

/*
select * from tb_pais;
select * from tb_genero;
select * from tb_director;
select * from tb_actor;
select * from tb_usuario;
select * from tb_administrador;
select * from tb_pelicula;
*/