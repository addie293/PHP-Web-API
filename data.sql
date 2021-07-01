--
-- Database: `assignment`
--
use assignment;

--
-- Dumping data for table `node_tree`
--

INSERT INTO `node_tree` (`idNode`, `level`, `iLeft`, `iRight`) VALUES
(1, 2, 2, 3),
(2, 2, 4, 5),
(3, 2, 6, 7),
(4, 2, 8, 9),
(5, 1, 1, 24),
(6, 2, 10, 11),
(7, 2, 12, 19),
(8, 3, 15, 16),
(9, 3, 17, 18),
(10, 2, 20, 21),
(11, 3, 13, 14),
(12, 2, 22, 23);

--
-- Dumping data for table `node_tree_names`
--

INSERT INTO `node_tree_names` (`idNode`, `language`, `nodeName`, `id`) VALUES
(1, 'english', 'Marketing', 1),
(1, 'italian', 'Marketing', 2),
(2, 'english', 'Helpdesk', 3),
(2, 'italian', 'Supporto tecnico', 4),
(3, 'english', 'Managers', 5),
(3, 'italian', 'Managers', 6),
(4, 'english', 'Customer Account', 7),
(4, 'italian', 'Assistenza Cliente', 8),
(6, 'english', 'Accounting', 9),
(6, 'italian', 'Amministrazione', 10),
(7, 'english', 'Sales', 11),
(7, 'italian', 'Supporto Vendite', 12),
(8, 'english', 'Italy', 13),
(8, 'english', 'Italia', 14),
(9, 'english', 'Europe', 15),
(9, 'italian', 'Europa', 16),
(10, 'english', 'Developers', 17),
(10, 'italian', 'Sviluppatori', 18),
(11, 'english', 'North America', 19),
(11, 'english', 'North America', 20),
(12, 'italian', 'Quality Assurance', 21),
(12, 'italian', 'Controllo Qualità', 22);
