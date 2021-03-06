-- Base de datos: `scrum2`
--
CREATE DATABASE IF NOT EXISTS `scrum2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `scrum2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project`
--

CREATE TABLE `project` (
  `id_project` int(11) NOT NULL,
  `cod_project` int(11) NOT NULL,
  `name_project` varchar(30) NOT NULL,
  `description` varchar(40),
  `product_owner` varchar(20) NOT NULL,
  `scrum_master` varchar(20) NOT NULL,
  `date_start` date,
  `date_finish` date,
  `comments` varchar(40),
  `budget` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `project`
--

INSERT INTO `project` (`id_project`, `cod_project`, `name_project`, `description`, `product_owner`, `scrum_master`, `date_start`, `date_finish`, `comments`, `budget`) VALUES
(1, 10, '¿Quién es Quién?', '¿Quien será? Adivina la carta.', 'emieza', 'lzabala', '2018-12-03', '2018-12-03', '', 20000),
(2, 20, 'Gestor de Proyectos SCRUM', '¿SCRUM? ¿Eso se come?', 'emieza', 'lzabala', '2018-12-03', '2018-12-03', '', 30000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proj_users`
--

CREATE TABLE `proj_users` (
  `id_proj_username` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `cod_project` int(11) NOT NULL,
  `name_proj` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proj_users`
--

INSERT INTO `proj_users` (`id_proj_username`, `username`, `cod_project`, `name_proj`) VALUES
(1, 'lzabala', 10, '¿Quién es Quién?'),
(2, 'emieza', 10, '¿Quién es Quién?'),
(3, 'ksedano', 10, '¿Quién es Quién?'),
(4, 'xusbcn', 20, 'Gestor de Proyectos SCRUM'),
(5, 'lzabala', 20, 'Gestor de Proyectos SCRUM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specifications`
--

CREATE TABLE `specifications` (
  `id_specification` int(11) NOT NULL,
  `cod_specification` int(11) NOT NULL,
  `cod_project` int(11) NOT NULL,
  `name_specification` varchar(60) NOT NULL,
  `description` varchar(200) NOT NULL,
  `comments` varchar(40) NOT NULL,
  `hours` int(11) NOT NULL,
  `date` date NOT NULL,
  `completed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `specifications`
--

INSERT INTO `specifications` (`id_specification`, `cod_specification`, `cod_project`, `name_specification`, `description`, `comments`, `hours`, `date`, `completed`) VALUES
(1, 1, 10, 'Caracteristicas personaje', 'Configuraremos las caracteristicas de los personajes en el archivo config.txt', '', 1, '2018-12-03', 0),
(2, 2, 10, 'Una caracteristica por linea', 'Las caracteristicas tienen que estar divididas en lineas, una caracteristica por linea.', '', 2, '2018-12-03', 0),
(3, 3, 10, 'Archivo configuración images.txt', 'Dispondremos de un segundo archivo de configuración, contendrá las imagenes con sus caracteristicas.', '', 3, '2018-12-03', 0),
(4, 1, 20, 'Diseño y Analisis', 'Diseño y Analisis de la Base de Datos.', '', 6, '2018-12-03', 0),
(5, 2, 20, 'Usuarios y Permisos', 'Habrán distintos permisos de usuarios: ScrumMaster, ProductOwner y Developer.', '', 4, '2018-12-03', 0),
(6, 3, 20, 'Pagina de Login', 'Habrá una pagina de login única para todos los usuarios.', '', 1, '2018-12-03', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sprints`
--

CREATE TABLE `sprints` (
  `id_sprint` int(11) NOT NULL,
  `cod_project` int(11) NOT NULL,
  `number_sprint` int(11) NOT NULL,
  `name_sprint` varchar(20) NOT NULL,
  `date_start` date NOT NULL,
  `date_finish` date NOT NULL,
  `total_hours` int(11) NOT NULL,
  `hours_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(256) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `rol`, `name`, `last_name`, `email`, `phone_number`) VALUES
(1, 'lzabala', '1D067E85070179168F971E499313A47EBD20C1149A312579BF12446A9C014C8A', 'ScrumMaster', 'Leandro', 'Zabala', 'lzabala@xtec.cat', 656788453),
(2, 'emieza', '58889A34855BFDF50D032E151EC0BB165227FBBEA912AA7B6FA33DC556714DE7', 'ProductOwner', 'Enric', 'Mieza', 'emieza@xtec.cat', 563221789),
(4, 'ksedano', '83353FC5A8FDB345A327B9CD55D88302FC7DAEC0026BC432025E0EEF6944E7DE', 'Developer', 'Kevin', 'Sedano', 'kevinsedanosmx@gemail.com', 617183420),
(5, 'xusbcn', 'D704C35861838F7BFD65C64D0E1EAF31F87673B9418BB627BA6464A5BF065DE0', 'Developer', 'Xus', 'Diamante', 'xusbcndo@gemail.com', 625334321);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_project`),
  ADD KEY `idx_specifications_cod_project_specifications` (`cod_project`),
  ADD KEY `idx_sprints_cod_project_sprints_project` (`cod_project`);

--
-- Indices de la tabla `proj_users`
--
ALTER TABLE `proj_users`
  ADD PRIMARY KEY (`id_proj_username`),
  ADD KEY `idx_project_cod_project_project` (`cod_project`),
  ADD KEY `fk_username_proj_users` (`username`);

--
-- Indices de la tabla `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`id_specification`),
  ADD KEY `idx_specifications_cod_project` (`cod_project`);

--
-- Indices de la tabla `sprints`
--
ALTER TABLE `sprints`
  ADD PRIMARY KEY (`id_sprint`),
  ADD KEY `fk_cod_project_sprints_project` (`cod_project`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `idx_proj_users_username_proj_users` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `project`
--
ALTER TABLE `project`
  MODIFY `id_project` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proj_users`
--
ALTER TABLE `proj_users`
  MODIFY `id_proj_username` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `specifications`
--
ALTER TABLE `specifications`
  MODIFY `id_specification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sprints`
--
ALTER TABLE `sprints`
  MODIFY `id_sprint` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_cod_project_project` FOREIGN KEY (`cod_project`) REFERENCES `proj_users` (`cod_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proj_users`
--
ALTER TABLE `proj_users`
  ADD CONSTRAINT `fk_username_proj_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `specifications`
--
ALTER TABLE `specifications`
  ADD CONSTRAINT `fk_cod_project_specifications` FOREIGN KEY (`cod_project`) REFERENCES `project` (`cod_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sprints`
--
ALTER TABLE `sprints`
  ADD CONSTRAINT `fk_cod_project_sprints` FOREIGN KEY (`cod_project`) REFERENCES `specifications` (`cod_project`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cod_project_sprints_project` FOREIGN KEY (`cod_project`) REFERENCES `project` (`cod_project`) ON DELETE CASCADE ON UPDATE CASCADE;
--