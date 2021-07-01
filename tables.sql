--
-- Database: `assignment`
--
use assignment;

--
-- Table structure for table `node_tree`
--

CREATE TABLE `node_tree` (
  `idNode` INT(11) NOT NULL,
  `level` INT(11) DEFAULT NULL,
  `iLeft` INT(11) DEFAULT NULL,
  `iRight` INT(11) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `node_tree_names`
--

CREATE TABLE `node_tree_names` (
  `idNode` INT(11) DEFAULT NULL,
  `language` ENUM('english','italian') DEFAULT NULL,
  `nodeName` VARCHAR(50) DEFAULT NULL,
  `id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `node_tree`
--
ALTER TABLE `node_tree`
  ADD PRIMARY KEY (`idNode`);

--
-- Indexes for table `node_tree_names`
--
ALTER TABLE `node_tree_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idNode` (`idNode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `node_tree_names`
--
ALTER TABLE `node_tree_names`
ADD CONSTRAINT `node_tree_names_ibfk_1` FOREIGN KEY (`idNode`) REFERENCES `node_tree` (`idNode`);