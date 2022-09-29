-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lukasdanuser
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `lukasdanuser`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lukasdanuser` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `lukasdanuser`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwdHash` varchar(255) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (5,'Admin','Admin','admin@shitmail.me','$2y$10$cBcrdSFtcNCM/j1SKYWApeAGOl4PLUMIFMF7paHuZUoe5m7OzHWgK',1),(10,'ZAP','ZAP','foo-bar@example.com','$2y$10$QjUfHzcgW1dS1.bWwtb/BugUxYOiKO4gA2mqgPJXuEOEfqRmxf4Ii',1),(11,'c:/Windows/system.ini','ZAP','foo-bar@example.com','$2y$10$2gm1gg6T7HEEdFDyd8170OSAW3dYklDl2cLRafHYmWdawcUyzWCve',1),(12,'../../../../../../../../../../../../../../../../Windows/system.ini','ZAP','foo-bar@example.com','$2y$10$JrmeO0qrHJ1kbqb2SkFILOEx4HsTjgXFSBNArpyoT7TtggRwB5Xyi',1),(13,'c:Windowssystem.ini','ZAP','foo-bar@example.com','$2y$10$E26ezpdqxOdO2H13crcOh.qYLX.UC4b/NLdwASl6Gmmw7rQBkPpl.',1),(14,'................................Windowssystem.ini','ZAP','foo-bar@example.com','$2y$10$XQKjnTXcm2UroaBmKWnjyOuZJdHR9MP1NQZUe9eVoCeVaVrRRMqGu',1),(15,'/etc/passwd','ZAP','foo-bar@example.com','$2y$10$rjPTYIekf/4oSIvY7fMTWu5mfT7jv4XkkAsRRlBc8dU6PhYJSpKDe',1),(16,'../../../../../../../../../../../../../../../../etc/passwd','ZAP','foo-bar@example.com','$2y$10$xzklW/.UV0tuMszJ3hWed.pEirj4v2jr2RUl5FlYdZCH/THa9HmIC',1),(17,'c:/','ZAP','foo-bar@example.com','$2y$10$Ung.rinx0PdFeauAFPaoeOjJdDn4V5XfNbryAN0NPMMniq2jMTBZO',1),(18,'/','ZAP','foo-bar@example.com','$2y$10$8GE.WWQLkTUy4APLgfF8c.97h3X0UavZVnW0gLEHDclmv1tCzxTCK',1),(19,'../../../../../../../../../../../../../../../../','ZAP','foo-bar@example.com','$2y$10$wJBb8A6tzGM1Os4dRnegeOUYt2Lc2agEjmQbgdosoiAPQutQzDGmG',1),(20,'WEB-INF/web.xml','ZAP','foo-bar@example.com','$2y$10$o3JjZgYudkrr5wFYc9327eijbGoHpaI1Y6TSWY/BKHPJfRp/HFXZq',1),(21,'WEB-INFweb.xml','ZAP','foo-bar@example.com','$2y$10$Do7h7aIZGaZn.d1e0a4Xqe6kq138.Av6yYLrNZVp5C3PElpNLTJ1q',1),(22,'/WEB-INF/web.xml','ZAP','foo-bar@example.com','$2y$10$OlKCaKCifBimp.dETKCt7uMkC6UEV5Ljfk5JA.E7SNUOhX/2CUQMa',1),(23,'WEB-INFweb.xml','ZAP','foo-bar@example.com','$2y$10$m5284EtKDj5R8ARRqGye5uTA3.w5hao4rx2t5Sz19NZa6J0HyNvhy',1),(24,'thishouldnotexistandhopefullyitwillnot','ZAP','foo-bar@example.com','$2y$10$buAWsYwV6.B58G0mUJulH.Nhpf7gjYQsGs/58ZnKEOGV7xK5n.meS',1),(25,'ZAP','c:/Windows/system.ini','foo-bar@example.com','$2y$10$BxG5qvwzqDjW5DTqGifHzORdlEJzHK83G3NkhD13Im4kSEDn9eAxW',1),(26,'ZAP','../../../../../../../../../../../../../../../../Windows/system.ini','foo-bar@example.com','$2y$10$ee6M9VCOnRDCsBBbCDXX9eZZXYdNuU1c..3Eozju4bZBqxAppP3Ky',1),(27,'ZAP','c:Windowssystem.ini','foo-bar@example.com','$2y$10$.HtWsL85tTt1RTjfACrj3.WVEUOl9ozkS4/qVeXKJj/47UHXaOr9K',1),(28,'ZAP','................................Windowssystem.ini','foo-bar@example.com','$2y$10$m/iVj3i1CK0wOs60XH8z1uT7byLMc7PK7Miii7TbxJR4OE1HYSumy',1),(29,'ZAP','/etc/passwd','foo-bar@example.com','$2y$10$GU4Xr2SCQ.4MbISzAzWqaOFKwQi3jRpwFJw4iRjm0hYEb8hTYROqu',1),(30,'ZAP','../../../../../../../../../../../../../../../../etc/passwd','foo-bar@example.com','$2y$10$wrRsiiOdu2WzNjo8gs8AGeGWQ4WrzuhQxcBLBqfl9FBDDhJ/6Vp4e',1),(31,'ZAP','c:/','foo-bar@example.com','$2y$10$ptIDFjrUVUs4gD2xewF.I.qk1VF7utWk03Nvt.fsqHuZhDepjvR3G',1),(32,'ZAP','/','foo-bar@example.com','$2y$10$cJuoaRz1EOPJYlEtqQBm..0tBCRGbXOCWzVBZmG21IuE/92sD1AXC',1),(33,'ZAP','../../../../../../../../../../../../../../../../','foo-bar@example.com','$2y$10$7qZ2XdFqLE/v44dVHrx4g.wThOloLyUBEV.MW5.qynyigmBmBQgQO',1),(34,'ZAP','WEB-INF/web.xml','foo-bar@example.com','$2y$10$mHGZ4I6TyPmd9fvrtsQjIefggoPKpg1UUDSBrCDQBEPkHxYcNuzyW',1),(35,'ZAP','WEB-INFweb.xml','foo-bar@example.com','$2y$10$0sQynjGnrhT3IkQIJ5DmTeHKZmxLRzfPEfMNNKw.pCl3PH4optUHO',1),(36,'ZAP','/WEB-INF/web.xml','foo-bar@example.com','$2y$10$fvlgEYDWb.z0IjzHneRUOu72KvuJmf4HEbUswYrFeN9ROJ0xGOxGi',1),(37,'ZAP','WEB-INFweb.xml','foo-bar@example.com','$2y$10$X5sesdWWeBaMgO0n22VcmOuYNGOjZ1z67Ge.VsoMNh8rBZjUlxca2',1),(38,'ZAP','thishouldnotexistandhopefullyitwillnot','foo-bar@example.com','$2y$10$CebyjTNlGiLMdvnbLohsE.zPy3lYjthaS8QU8znYq2oIjcnf7MSlO',1),(39,'ZAP','ZAP','c:/Windows/system.ini','$2y$10$iUXR8ovVla6zU2Ym.fUURehhizOVvCFQQd.BD4r7hwvwfiBKXQkui',1),(40,'ZAP','ZAP','../../../../../../../../../../../../../../../../Windows/system.ini','$2y$10$/ZdRhRSSB7GkXz43u8BTGuNm9JdFSsW/hwpQkk8O7C98bY//e64bi',1),(41,'ZAP','ZAP','c:Windowssystem.ini','$2y$10$zTD5N//WUqVJxKz4Q7qYJetM88Vk/jyPSlLqJ0VynyytW4MDViNkO',1),(42,'ZAP','ZAP','................................Windowssystem.ini','$2y$10$RTaCohCQ470gx1NkJmTvhOWHYDoDyMBvCoXPkidTFABkkX5cSaXhG',1),(43,'ZAP','ZAP','/etc/passwd','$2y$10$rHL3p19co84o.o9LkSEfWOYu09NV.pvGCq/UoOPtk6LO.fnFa/cOW',1),(44,'ZAP','ZAP','../../../../../../../../../../../../../../../../etc/passwd','$2y$10$yd1vYteQ0cOnvFc.wRqGHuPy5SC5IFVHjP1yoMOTmTyTpdQEB4RCS',1),(45,'ZAP','ZAP','c:/','$2y$10$snFzsFf9B/XUYZkCaYORm.HofFQwqrH.uB7D8y4RRKN5O11LR.X9W',1),(46,'ZAP','ZAP','/','$2y$10$9o7D1uvRjMEkW87nctDn5OvApjgI7hGtfM80FYc.c7i8pjjXFDUdu',1),(47,'ZAP','ZAP','../../../../../../../../../../../../../../../../','$2y$10$TyNg9yEiYmgcTD6sj8u3SOQOFsEduDMGS2H/Ge/7ZoNsVcPyOIeWm',1),(48,'ZAP','ZAP','WEB-INF/web.xml','$2y$10$0j65L9AfOsC8WZ449VN.jOhvCn2jX2CY2xoM.Gc083x3mc3HulT5y',1),(49,'ZAP','ZAP','WEB-INFweb.xml','$2y$10$vk.G/2az4YcNR5zKMe8gt.cu.JW1cSbqdb3QjJZajDkUIR4B7DzJC',1),(50,'ZAP','ZAP','/WEB-INF/web.xml','$2y$10$z/vVmDDoqSQg6APvKm8RqOcyc6nR8ET1obMQNfTy2v0bpTCEiwpV.',1),(51,'ZAP','ZAP','WEB-INFweb.xml','$2y$10$O.NKm6CY5vOqKMSZsiHLXeAafqvYAXc/5siSRaQ9Tlr2He8v76rXG',1),(52,'ZAP','ZAP','thishouldnotexistandhopefullyitwillnot','$2y$10$BoR6tsWiokV5Bk0QTeXH4eNGyfMPtnsQ9ySWl5l.Jr6m3HwQ8f0OO',1),(53,'ZAP','ZAP','foo-bar@example.com','$2y$10$vMIxDlcJle214nCsHCg3Xuk5nwdjRsRO2DuPEm7EmUlmGLPE8zdQ2',1),(54,'ZAP','ZAP','foo-bar@example.com','$2y$10$zZDMV4CVFsBDxzuYW/Rv/uuorDfKUnNvElQBBr7g6ThBU/I0sw8Ci',1),(55,'ZAP','ZAP','foo-bar@example.com','$2y$10$T29DU8fDsKMkMuGZ38wTK.aoXve.EfA2GcRUm.SyEi2pYbKnXsMjG',1),(56,'ZAP','ZAP','foo-bar@example.com','$2y$10$XwvkI6gkM4zcAit7YE9zReGL2z9ZZnL7tWn3A6X9lNSk54meLMRri',1),(57,'ZAP','ZAP','foo-bar@example.com','$2y$10$hHCQfq/43ql1e2Y9DwOP3e.nH4VJDlI8YQ9LPBN6VX/COQEbv4VaW',1),(58,'ZAP','ZAP','foo-bar@example.com','$2y$10$HONJy/d92ctvK8QzmhG2z.CreIYYjRYRXDLRjucbnzmVhHTMk9QyW',1),(59,'ZAP','ZAP','foo-bar@example.com','$2y$10$Ld6kw9vlXlZV..2dzNqu7ueeBAEFwfeAfVRhEHaGfVS7ERRVVs/H2',1),(60,'ZAP','ZAP','foo-bar@example.com','$2y$10$aK8KfP4PspVBcXuAIEyureSovjq6Mq4xzfFzekI8OZDf14Hcf3lQu',1),(61,'ZAP','ZAP','foo-bar@example.com','$2y$10$Bn6rjbo.U3NmT7Pyk4UxyeStxAYO2jm5wb/FxSvs9MVQTYHsS.p4e',1),(62,'ZAP','ZAP','foo-bar@example.com','$2y$10$1LeRAGSDTXhw.2acP00nJusDPIkzXfxWiEpZFgddZ.Ukuugb2KAp2',1),(63,'ZAP','ZAP','foo-bar@example.com','$2y$10$fPVuI6d5zqG2Nsfatsl3JeDibFE1WdH5WIXql3ZQrjdVxO9tEy5GC',1),(64,'ZAP','ZAP','foo-bar@example.com','$2y$10$d81LCDarcH.9F1Vau2Xq/.yPZAcyYbzSO7f4NNLUb5PAs3gryr/Aa',1),(65,'ZAP','ZAP','foo-bar@example.com','$2y$10$hdI4ZbiD8AbVE6dRfgbxJedCbPHXAWdXxgR6ECbmh2mb00RHSlzUq',1),(66,'ZAP','ZAP','foo-bar@example.com','$2y$10$P2DO69AEEKH.KRc9vTTdWO0ToxyRWzGZW.gGxE0gH2yDrNgTTJ1w2',1),(67,'ZAP','ZAP','foo-bar@example.com','$2y$10$oM7cJZ02TQHR9H2SqpSY4.ZTnJNJioYc5FSqCKuo2Vq0wYgufpyVO',0),(68,'ZAP','ZAP','foo-bar@example.com','$2y$10$UzzgDxBqWuXhkudG5vG/GOV1JgMwcWGdQCuxvGDmYUplrhip9Tdmu',0),(69,'ZAP','ZAP','foo-bar@example.com','$2y$10$gZdrffiXM/2Df9j.RUZ6/eHP1W.LZC6O.MAhAjOg6ZgSDHwich8Ym',0),(70,'ZAP','ZAP','foo-bar@example.com','$2y$10$P3bGKnmdP0Ob7/tALQkMkealBWwsZCiguTM0SxNYRbE/QwP9.xVpe',0),(71,'ZAP','ZAP','foo-bar@example.com','$2y$10$FSrZm07NS/e3LZ.AeivK8OPnFv4WvBbsjBXsEBQW6GyQYF3CmaEAm',0),(72,'ZAP','ZAP','foo-bar@example.com','$2y$10$WrCB.DEv1a6gLbyi9GFAWefkAHiIg6iQOS5ftR5hz2e/.SdrzjPaW',0),(73,'ZAP','ZAP','foo-bar@example.com','$2y$10$NDa7ZZTLyIuL87bF5JaasOo6odKtidi4Unvl1tCGa7aRy7lJbTpdC',0),(74,'ZAP','ZAP','foo-bar@example.com','$2y$10$025gCOEAtYusN66xUa21Xe37TPH7RtCYlGffsX6CmSY3rge3LA.n.',0),(75,'ZAP','ZAP','foo-bar@example.com','$2y$10$y5ulQnDs4rog0HrD5/6Sree32Mok1vOPEPzlvT9SFI4dmjmv/Ov2.',0),(76,'ZAP','ZAP','foo-bar@example.com','$2y$10$/BDagPuZuqB7JrFEzYlWceAVdMdg.vzS6mB5WzhfgK1aT754EX9bS',0),(77,'ZAP','ZAP','foo-bar@example.com','$2y$10$FR5Q9Y/CiHEruHqMKQCYoeKIqf1nSdu5hIxw7zWbrTg7IArIG.W.a',0),(78,'ZAP','ZAP','foo-bar@example.com','$2y$10$3N9TIpmRhj3UmzfQKVJ8OuFTzV6b2VYebXOlYg0e1FVHUq91niVjm',0),(79,'ZAP','ZAP','foo-bar@example.com','$2y$10$XaGIfTRquBXugBErsAInJ.TNSqX6B5dSLY5MQacihY2L2MLcQ1Zmy',0),(80,'ZAP','ZAP','foo-bar@example.com','$2y$10$Vs0KOc6R.4V0tBdIKj4niOUHhMw85.fA9K04KFhgPU41lCiVs/WRG',0),(81,'ZAP','ZAP','foo-bar@example.com','$2y$10$t97z2fk17JUiYAcwTwfAfOEj4TERI0DhS52GfxDIojBe6uF9PEHXO',1),(82,'ZAP','ZAP','foo-bar@example.com','$2y$10$ThU1wXDoWs2Vul/caEdFEusquc7hQ3ortBdgo7tVnBRlmEqszSG2C',1),(83,'ZAP','ZAP','foo-bar@example.com','$2y$10$KGE.7gcY/8lLpbxfrv9NbOD.7IanLUqoKVZSoGlQfU3Yf/KLeidRq',1),(84,'ZAP','ZAP','foo-bar@example.com','$2y$10$iVCUQ2sUVXQq3X5iYH/M8.AVQA2vP5FeOf0j1Ms2383f2XEmpMur6',1),(85,'ZAP','ZAP','foo-bar@example.com','$2y$10$rIGixf7YEnAKRChVawzx/uH6DkdZBKJCySuJQiFeKjWHFxCIrhDTK',1),(86,'ZAP','ZAP','foo-bar@example.com','$2y$10$mwkFAwltcSacooTBe1nDp.Ryovhp6pRnSf0CzL.kdsqfpjIuLyE22',1),(87,'ZAP','ZAP','foo-bar@example.com','$2y$10$hN1X97TDTq7KpAWoU/31u.j5DCKG7sg9zd47itolD3Fl60Bb19OLy',1),(88,'ZAP','ZAP','foo-bar@example.com','$2y$10$fhwMIq9T.nYHLEw4Uk39W.Fk82XXY3/TU53.v7pfrLQvUK3jez0vS',1),(89,'ZAP','ZAP','foo-bar@example.com','$2y$10$RB51AfWVxhi5kc137nmHheU9BzmtptCJCudYgMJGZuSEX89b6gWaO',1),(90,'ZAP','ZAP','foo-bar@example.com','$2y$10$1cyLSAQbouR3fPxii/ZugugdAFbulgbIyTXijwf2jDAnzF245VwVq',1),(91,'ZAP','ZAP','foo-bar@example.com','$2y$10$8Z4QCt4DpFshkAeXG7qPquJdPJezb0PV0/cnQ0npGyOsX.W2PIrN6',1),(92,'ZAP','ZAP','foo-bar@example.com','$2y$10$ffeLQ17CC3mFuk6v.mTulewLuWS8WGU73nC6Q3QSZWrFXu/A8HA16',1),(93,'ZAP','ZAP','foo-bar@example.com','$2y$10$UKS2jvVxTjS/4KjqsqstQO1F9cKVpIyQ2nCt809s/1tcfeKXGJ0ei',1),(94,'ZAP','ZAP','foo-bar@example.com','$2y$10$ErjyJ6xSHtt5FUxtcE7KTuBohy80cS3ARLHznwTFluVYbT2uDECSi',1),(95,'&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;','ZAP','foo-bar@example.com','$2y$10$uEohbTo0TK5gLXEmNj8gKOAGOJ8abvs2SixLqeTaDt/TV0QNf21p2',1),(96,'&quot;&gt;&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;&lt;','ZAP','foo-bar@example.com','$2y$10$bdgL9eTHyOrQBaYzIDyAeOLUjbMHpx.OzzBRKg8e2uiAtuoOWrjpO',1),(97,'&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;','ZAP','foo-bar@example.com','$2y$10$mqez/hTmmBp8jfZ8NiCJC.HxWj26KdwFVwFjiClzSHM3FB/UqWu.i',1),(98,'&quot;&gt;&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;&lt;','ZAP','foo-bar@example.com','$2y$10$VHq9qgFQR0B9XtvqlH.g2eK.7qY6IRYk3dAgK4cpEM9v1XcR5eGpO',1),(99,'ZAP','&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;','foo-bar@example.com','$2y$10$9Q0f4L6Jh3EP5b9Mkty/ueIQxc9298xmtiuW6QOWcCe6sxeGkUg8u',1),(100,'ZAP','&quot;&gt;&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;&lt;','foo-bar@example.com','$2y$10$Sxxd20TkKc2Nn1yHhjAqh.lBA0AzIJSjiY9gZoAX8tJzHXRpmttBu',1),(101,'ZAP','&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;','foo-bar@example.com','$2y$10$xwPR4nlqgvkFnn7lqSEy4.GynJ4f/tjige.Z.9uzI6CEQ.lS5DnMy',1),(102,'ZAP','&quot;&gt;&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;&lt;','foo-bar@example.com','$2y$10$tQh5smlkQmsJVrrwqz.y2.Fo2E6T.aBSdKzYQ0dPeZl/3qtJcGF7m',1),(103,'ZAP','ZAP','&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;','$2y$10$rmP0UudSdg0y2p7ltGtxieKnqcb.sNqtyaSFwMDt2/VxE5yP0NVka',1),(104,'ZAP','ZAP','&quot;&gt;&lt;!--#EXEC cmd=&quot;ls /&quot;--&gt;&lt;','$2y$10$22nUWpQM.ydeMJreIeffSu0OQW5YUkCNpEL.zHV7LGjWUdcOY.kdq',1),(105,'ZAP','ZAP','&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;','$2y$10$nBea2f3dI7bhS7y/xUh.eergjaXrMJ/grrFv7L3EFCDhh6yz.fw9S',1),(106,'ZAP','ZAP','&quot;&gt;&lt;!--#EXEC cmd=&quot;dir &quot;--&gt;&lt;','$2y$10$eWOCIFduTBfGCrZj/45fXeYO9HHWg4X00sVEKQpNrYzDUeZzEH02C',1),(107,'ZAP','ZAP','foo-bar@example.com','$2y$10$u7wSJ7kubCa1DCW619H1M.3ony5Qk71gNyOBh.JIX1kmK/eFByZIq',1),(108,'ZAP','ZAP','foo-bar@example.com','$2y$10$vRpMNUdoOQd54bKWw4OkKuGO3F0CiaS3ZmEFu.o0EJNtXmXURrOiC',1),(109,'ZAP','ZAP','foo-bar@example.com','$2y$10$j0tWYnMpnsBk0Sjzzn3q4Oh7VLeCsSfuArYA/0zqVgcrkCvfk6AQ2',1),(110,'ZAP','ZAP','foo-bar@example.com','$2y$10$IRQ5tY4TLFgvDqnHSsf2I.BkSagGQGZJBDgamvCC9nythSJs4qCUO',1),(111,'ZAP','ZAP','foo-bar@example.com','$2y$10$mBocu1rDjLkAPnnHpNtJlOJWV3sUUGqrDefa0xh8187OGsxGSeqli',0),(112,'ZAP','ZAP','foo-bar@example.com','$2y$10$/3x31zQ.c5vjBEWSfWD/heaG1OryHM3PrjRt5NNCD.9ETkYwjEcNy',0),(113,'ZAP','ZAP','foo-bar@example.com','$2y$10$LcjdfB2a6vqSxgg3/K7GRuawJ2LefFNtVs1fXjRnriM1dPWeRRvvO',0),(114,'ZAP','ZAP','foo-bar@example.com','$2y$10$8ZIztN2OXadDLpd6iZXaouCTUredwdnPgT1ABl9Ed73yGyHAT.7qS',0),(115,'ZAP','ZAP','foo-bar@example.com','$2y$10$3jIOTuFUiBX.SZzZuxH6j.UiGuxH6AmkC5MHtW7A5ZFLd8QCzBFEa',1),(116,'ZAP','ZAP','foo-bar@example.com','$2y$10$CEUZNsI6YKTRMkAUUS0an.OGugWfhtRyEsINuLAFDSQYB0Sz06vDK',1),(117,'ZAP','ZAP','foo-bar@example.com','$2y$10$EAA4E5VT.rCgIl749JlUFutJhnboOhDGlkOzsGgW.my5yFdEG71AK',1),(118,'ZAP','ZAP','foo-bar@example.com','$2y$10$7iPw9eQion8A0YUhyIwJeuYegZb/6V3XPzkCvBJOiChbqe6FLp4sa',1),(119,'0W45pz4p','ZAP','foo-bar@example.com','$2y$10$c.3XwxBeNMYYuSV5RghCS.gC2YYNMkNpD4lHisiCiwvQVa8MqFi6q',1),(120,'ZAP0W45pz4p','ZAP','foo-bar@example.com','$2y$10$TElH81Iotfayrcuva2zsdevA.J0g2sVb8/zRELXyKnMCo73RTp.F2',1),(121,'&#039;&quot;&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','ZAP','foo-bar@example.com','$2y$10$CbgELtMmbmglRIKVHrjNuOT4OJZVE35VKVHbsNl0qeEc8vDgWiFJe',1),(122,'&#039;&quot;\0&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','ZAP','foo-bar@example.com','$2y$10$aelSE8Gupy7fkccrDhU4YuDnXWq84xKMF4cwm/x9Oh8nwUaus1SKW',1),(123,'&#039;&quot;&lt;img src=x onerror=prompt()&gt;','ZAP','foo-bar@example.com','$2y$10$UTULA..7BWnfd6PJMijzIOQdaV7u7TDFVxx3rbh2caD6zW.3.6j96',1),(124,'ZAP','0W45pz4p','foo-bar@example.com','$2y$10$HJeiab7dTItjjl6rZsZ.0u0q9hKT4S1qyKRfa6gDA9uEPYoog8CaS',1),(125,'ZAP','ZAP0W45pz4p','foo-bar@example.com','$2y$10$xbkXzNZXJpKDfUiEcNXOfuS.cOcdsPOuUuH3P1/0gq/xF4rKIl/EO',1),(126,'ZAP','&#039;&quot;&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','foo-bar@example.com','$2y$10$AqnawMuaQeNfOxjuPkkuGOeEoFq7sJKOmsSQQXFCRFeIYR84Fa3vq',1),(127,'ZAP','&#039;&quot;\0&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','foo-bar@example.com','$2y$10$/3qXxzcuOBLdj7Dz0ftkEe6KFNhP9FhlDWo7S/tL.IRvkwLD6XFAa',1),(128,'ZAP','&#039;&quot;&lt;img src=x onerror=prompt()&gt;','foo-bar@example.com','$2y$10$MpzfL/SicZDE2br6QPzSvuv0S1NdLKq3vf.DneJFASv.UhF46VTce',1),(129,'ZAP','ZAP','0W45pz4p','$2y$10$3X3Xw2KzWKup9fFqXocf7.iGg5UIPS9ik5HPEVw//HT8PUfu6zowm',1),(130,'ZAP','ZAP','foo-bar@example.com0W45pz4p','$2y$10$aqUhxalgLsfQT4IMghPTpOVljWRqsNeaMKgjioupxU9v2pyOGbZtG',1),(131,'ZAP','ZAP','&#039;&quot;&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','$2y$10$cnJfXJtf3JSHkrxnRjm2AeF7pinom1yseAwTPkia.qQm8PKstdtxK',1),(132,'ZAP','ZAP','&#039;&quot;\0&lt;scrIpt&gt;alert(1);&lt;/scRipt&gt;','$2y$10$/hUJDFL2ZEk10mAzVX.RpuWNvuqmZN12p1h8254gmmEkN8BS9cNaG',1),(133,'ZAP','ZAP','&#039;&quot;&lt;img src=x onerror=prompt()&gt;','$2y$10$dpVOOCYYIVbJhB2SoiUwX.YNMCY5qHAL4LgSohAKnFe9vnl6cc32q',1),(134,'ZAP','ZAP','foo-bar@example.com','$2y$10$kCKxeTRLdZhtuDq7dIF16./cAM64A83RfR6PAuZ/2ezK4JNAiKicK',1),(135,'ZAP','ZAP','foo-bar@example.com','$2y$10$9aTx7gg1iIpsjOOu2vGcG.e46hYLjInWVtsGUNLGFh1twXzvUJbqu',1),(136,'ZAP','ZAP','foo-bar@example.com','$2y$10$Ib0Pp./6BSDASvwzYxrmue6P89znEk2VA5wjNgvwSk4dx8/nKMFf6',1),(137,'ZAP','ZAP','foo-bar@example.com','$2y$10$XB6X29EjZ8zzavieZlNscujfvupZQQ2RDV9STgC/P.trhksPqI5sS',1),(138,'ZAP','ZAP','foo-bar@example.com','$2y$10$hvAekkVR0gr3LxEg5OHtNOiyZ04kJwPISs7lp1UhbZ00L8T6wjAry',1),(139,'ZAP','ZAP','foo-bar@example.com','$2y$10$hSufDxpAAa6HtklG0TECG.mz5oXeIULsMZ23vZuPeQX19ACe7Ari.',0),(140,'ZAP','ZAP','foo-bar@example.com','$2y$10$8X7LQNpKt6EtuHPBGQZSCektg7tkwaJXRXkZNZ.NPLFm5/2ZKbqbq',0),(141,'ZAP','ZAP','foo-bar@example.com','$2y$10$08GJh4ZO1Sw24/rkVHFu6.6heRKa6WJyzTu6cd2pevswXM/lyuDv.',0),(142,'ZAP','ZAP','foo-bar@example.com','$2y$10$OdGes9JRN9JMno6WDscUNuxnQ8M6eTgvh1RKxy32jMv.J/HBkW3Cy',0),(143,'ZAP','ZAP','foo-bar@example.com','$2y$10$OyYSfJ1iIXOokQsNYi8cKeb2t.yArpYAuMuRc09uLDbbom4BLR382',0),(144,'ZAP','ZAP','foo-bar@example.com','$2y$10$Qqj9opmF9jW8KsT3Tqfc..ksu2PsODJ4PkFg/pADnc9.pdGNVzCcm',1),(145,'ZAP','ZAP','foo-bar@example.com','$2y$10$dvT7X5gSykUfjWMIJbmHqO0piq1tJBFfaX04111INdQRqfciaUmT6',1),(146,'ZAP','ZAP','foo-bar@example.com','$2y$10$7cS1TZbaepjJKAzLORgQG.pHm7x53gOmtvRukNO/rGvIac98uFUgy',1),(147,'ZAP','ZAP','foo-bar@example.com','$2y$10$DODQRsOVhUjadD8Tyl03auJCpUBxAijY7ujJOeSG79H.k9aSIkIp6',1),(148,'ZAP','ZAP','foo-bar@example.com','$2y$10$mJEYl8FqIYkxfx4ek42ZOOg3kjc6e9JGwnf4GGW1RvvXwkY2TUdhC',1),(149,'ZAP','ZAP','foo-bar@example.com','$2y$10$z8s70797.tPCy67AQD7avuLiO8V5O8IIWIkh/Iw0PyHf5jvYN0qXK',1),(150,'&#039;','ZAP','foo-bar@example.com','$2y$10$4bFvH6B.76w99Z6GvMWOT.VV4JoTFhihRFVvznvIe2.dRjn1oRv0G',1),(151,'&quot;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&quot;','ZAP','foo-bar@example.com','$2y$10$wQRH7DotrIlPAm/hnVe1Jus.24QPze37itnJaQT9JHPcFxn0l.ZU2',1),(152,'&#039;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&#039;','ZAP','foo-bar@example.com','$2y$10$mhMUOQqJin.8yDWp7cU.6.ZjbkQ9rhDsXol9i4.PENbPHaV/aFmge',1),(153,'${@print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110))}','ZAP','foo-bar@example.com','$2y$10$fGNEJMHwsVL.wI0UE.zWE.yeV63DNcbNlwytuL8h4qlQ9CeL2dpKK',1),(154,';print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));','ZAP','foo-bar@example.com','$2y$10$B6sm0SJK57rlxssLxuqDWu/42uy5AZf67cw6vInYZwYdv39OC/xCe',1),(155,'&quot;+response.write([13&#039;008*731&#039;553)+&quot;','ZAP','foo-bar@example.com','$2y$10$Wdlz0b40r7unQ3ZcGP1hteFmo3BVbtnnv73DBgsysa62Z0Yk04b2y',1),(156,'+response.write({0}*{1})+','ZAP','foo-bar@example.com','$2y$10$PO7hdixKP8t6UM4ZkEey9ukUxlcjAutlVmv2wLIOPhzV/vf7W9J5S',1),(157,'response.write(13&#039;008*731&#039;553)','ZAP','foo-bar@example.com','$2y$10$nnMaYPdQUHanxykRPq47iePauA.B2DjdfCkJ82QbgsQregZJ0i8ia',1),(158,'ZAP','&quot;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&quot;','foo-bar@example.com','$2y$10$4/RnMc4sXGdJ4h2xotjDhewpP/9YcQriqvRO7aDu2C00RIatUSplu',1),(159,'ZAP','&#039;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&#039;','foo-bar@example.com','$2y$10$adz/Hziaxu.ElYsuOljsDu19HhSlD8ojtMcqxfETmWIqNpGthA0rq',1),(160,'ZAP','${@print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110))}','foo-bar@example.com','$2y$10$WZy0zc6TEVRXIU3MvhcoqO1HHKVtSMxscd4KHlAGkAOnbCvSeHCyS',1),(161,'ZAP',';print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));','foo-bar@example.com','$2y$10$N3/ztUeORiftYoUj5P2S6Osp3TTupVuYrEhBKerb3H9gAWfhYrgbS',1),(162,'ZAP','&quot;+response.write([386&#039;749*897&#039;628)+&quot;','foo-bar@example.com','$2y$10$qkQXVmW4q8JFtkqFasrF7Othl2lrZGHGUg4dqXceS.EElPLrjnHQK',1),(163,'ZAP','+response.write({0}*{1})+','foo-bar@example.com','$2y$10$s1qS5lHuURHo6MBPXUWwSumQU6vTJ1j7GKy2501bjwNMRJ9hHTSiO',1),(164,'ZAP','response.write(386&#039;749*897&#039;628)','foo-bar@example.com','$2y$10$SzF/Z/9gzaqXruBpif05RO6yI0pO.nBcgAhdgQhMibbRMfRDysPcO',1),(165,'ZAP','ZAP','&quot;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&quot;','$2y$10$acCZb0aNVSTix0onXYbEReVgvm.7NdYcngd7Kqvw7.oiN..7t1j7.',1),(166,'ZAP','ZAP','&#039;;print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));$var=&#039;','$2y$10$xpl0twCfh3iGDi9cGo5.b.bmJnIBLoHzx1Fd31ggJpAaYHoXYoPs6',1),(167,'ZAP','ZAP','${@print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110))}','$2y$10$uWJHqxXaBjesTb7Xhc4sv.4xdlSH5kj2d2U8j57poTSH1DdUD84W2',1),(168,'ZAP','ZAP',';print(chr(122).chr(97).chr(112).chr(95).chr(116).chr(111).chr(107).chr(101).chr(110));','$2y$10$1/Yv2XyxFVYDsAhE.e.YMuJR.ulCBJcMFmKDb266OpTjmubAlQSca',1),(169,'ZAP','ZAP','&quot;+response.write([640&#039;485*7&#039;082)+&quot;','$2y$10$Rjuq6oxA6KEHc4rvbFXKlumJ9jBG3NguMjVsWdSuatFQC7gU4jQ.y',1),(170,'ZAP','ZAP','+response.write({0}*{1})+','$2y$10$HuGSPdtGmB8f7svW74xQw./dDcL2oE5My4.wsYxhoUGLKoI7YrCT6',1),(171,'ZAP','ZAP','response.write(640&#039;485*7&#039;082)','$2y$10$RYNk.27Vqzz6p6dr3A6dA.TOhoYdcT8LAR.U/KUTA8gissYdeFPqS',1),(172,'ZAP','ZAP','foo-bar@example.com','$2y$10$CelwUMQ894YRd80dD0dBoeJiFNBEFnFoESIoCIgNWyrFreQIp8RPO',1),(173,'ZAP','ZAP','foo-bar@example.com','$2y$10$5cvwX6wz/Ic9T1vXVv0fxOiOAwsIJSkWEjm06iHNy5jVjNEgEFKM6',1),(174,'ZAP','ZAP','foo-bar@example.com','$2y$10$egIxhtC7GVHwvR3dWT1Vbu24GgAyDfuZmlUjlVYDt13.oXaYpJdIq',1),(175,'ZAP','ZAP','foo-bar@example.com','$2y$10$YZQeDjMQFd95vZLSiDRQZuNZJaGC7/ZMdN9oZQcCpzAD2IbC7pJcu',1),(176,'ZAP','ZAP','foo-bar@example.com','$2y$10$zHZ1DzSf2yDOiD8lWdt5cOQGufZiNYqgV04Uy0z3TRmuBzcQ1OzOK',1),(177,'ZAP','ZAP','foo-bar@example.com','$2y$10$U0O0Kwcav4qjASrmV1qEouRVwM1pJLR5DzmWnbYjF0jQjmHJGaNNK',1),(178,'ZAP','ZAP','foo-bar@example.com','$2y$10$pTNCQe9D7XDepEIljl/L.OZLIgtnQfrvQZjvkizmeqJ/PhtPzIBdu',1),(179,'ZAP','ZAP','foo-bar@example.com','$2y$10$z/RHfyStw67Na33UT5INduXSjYzFj1oUG2HSRlN5adITVUGIZ.FtS',1),(180,'ZAP','ZAP','foo-bar@example.com','$2y$10$2hvFOsTsSoSzuTU476wGsuNZ/P9FtDTvVzvD90XhCCEaDWFDsVnky',0),(181,'ZAP','ZAP','foo-bar@example.com','$2y$10$Yq0x.yG0Omj7uXnJ/O/saeNBI0umLp1F978swjyxNQvNrySqqt4f2',0),(182,'ZAP','ZAP','foo-bar@example.com','$2y$10$8Go1QarZSH/2KZGLtGvTI.p21iBtd4ZEdfOEaTx4PeZRbYjcoVMcK',0),(183,'ZAP','ZAP','foo-bar@example.com','$2y$10$5NKxstlY/GvTaAZhptNLc.I4s.1CC.nfiIbZ1GJJiGJTAZlxI8p7O',0),(184,'ZAP','ZAP','foo-bar@example.com','$2y$10$dgJ3tovikgcmeugcaKRtYuf4CcvOJpJzXH0vFDuK9xnYnrxHpt4iO',0),(185,'ZAP','ZAP','foo-bar@example.com','$2y$10$H0VT35EZML1iZlizG2CUiOceBog0VuNDkLS6LFTRunlmUYKtFqpRW',0),(186,'ZAP','ZAP','foo-bar@example.com','$2y$10$7tP8PWo/563xkvvK5ckLEOEnd.kLun4y1ARYtlA/y1lGi3S2IwZ9m',0),(187,'ZAP','ZAP','foo-bar@example.com','$2y$10$C2DTgAJ4SXlri6w.ta1U9OqUwJ//.4IjgK9TEkle101vDm9wKv1Ni',0),(188,'ZAP','ZAP','foo-bar@example.com','$2y$10$MKsTFJDwWtTKpQ1sIy2NQOLQKm6wz1tXw3PhtAQ8yW7TCzJrNLNzi',1),(189,'ZAP','ZAP','foo-bar@example.com','$2y$10$y8Ami3JV2PnBvlrN/IWyjezgVGiTxWqrvn4k59JTfkskKRrRQXvpy',1),(190,'ZAP','ZAP','foo-bar@example.com','$2y$10$SGyGYPJvjQLVPsGOPsKqQeNSPnSzq86Lh1rdiCgNHed1ZxI6OXQmq',1),(191,'ZAP','ZAP','foo-bar@example.com','$2y$10$BY.VnHdlHbtY9xFcdLN0FOteKGEJE9Sp095WW8F/Tq8B81cepHQ5G',1),(192,'ZAP','ZAP','foo-bar@example.com','$2y$10$zPh82BIcp4wa2Xu/QsLG1uWv6oyvIlXZpKJC/pzMvyRHN8YRDmDU.',1),(193,'ZAP','ZAP','foo-bar@example.com','$2y$10$wHzXlPCJjtVHmN.3kJkVHevW.NNeqcuKPm1wEAYaVQZv4HyZd/sNa',1),(194,'ZAP','ZAP','foo-bar@example.com','$2y$10$/yAMZTd.u6S1rQzu2o.Qi.BPQDX7xYlwn98U01oNMtMNGw9XIBQ9m',1),(195,'ZAP','ZAP','foo-bar@example.com','$2y$10$XFpcl7yDUEpwP6FtAIuWje7zNiBRD3x6a/H0wZlJqKX/VZ.2W1Zie',1),(196,'ZAP','ZAP','foo-bar@example.com','$2y$10$hko4031DyiO/FZnxTsb.8.nenNv/bjvcNfQsSmUsAJdEAcwGQM9vO',1),(197,'uYUvEHRQIDNIdabfoQQqQbaebtUdVWiXcLWwdjVSpCMtqaALXgBOtfSQSidbFSUHiNCGjeEwqCGEjnFbPaWrpFUZCewPYXAaOGtLYSFqvCJPUqrjXKKfuyExTkFQkdZxeDFHbLrsoGluyaVcjMfxieWQcYVrrRTYLCXlSfxUyVimVulGXIeYBimHmKMHFWLbdKLnnKaxcxyWOKydstBoAnLFkvFdvkLAQdHHtrgwQZANBlaBihhldlSfHcpFJfP','ZAP','foo-bar@example.com','$2y$10$/S6bqcr.NeS41rAVF8touOylp8qWEuBrEazVCBjQhlv/UEYCid4QO',1),(198,'ZAP','rUHZQemWRhNiLWhnrfgDoNqdTWAUugWFLCwfLLfBoTOYCXmWXdoxsAkkDyWcZrqkOtRRjvlDQFgsaZRfQHDbaWcvdooGgcWwEwrSomUQlCFOQICgkKoHbMyGeyvsPSVOCldCHPvXkPCsMQIxETVMVUqBfSStnTeUWkloNVaiJrDdkaUFyyVOeorXfGUCAEXMLxmNKfqQgCEvSPKgdiQJwlqTJdTdSNaWBfXPvfESMroZwdqnsKmmGkaZoiYrere','foo-bar@example.com','$2y$10$UOHuKtOIwXpNOCv2q1VlzuDJTCl5yalN/LVoucIcakNt3R7JjoJy6',1),(199,'ZAP','ZAP','KTpVPxMYjpOtamgjvYarGRUFbPbwLZsRExQueippuMhEppBbeHshnahOWGBKoEmUnmLFafsolxMkSEyqYwSUGIknkuPFlBZDBFLqyRbEjQbHcpNdCRFsydPKsqgbcQGwwiAhytCkUrgXwuGRdBUNqNvCxCSUbpnlUhYpaMgedcctSDFLIUajUOULUgUJUHQOptNYPoQwEyoxQKbWpIamNEuYJrOPLfgmPlkWIxHoiUvaOpqUyITJGcwDnrZRNhn','$2y$10$yDZjPAiA9/.rZL/VSRD2Ue2boOwNLToS/rQlOE9zLP7Yf3TWSMMrO',1),(200,'ZAP','ZAP','foo-bar@example.com','$2y$10$/4YZl.tKczTjQB9/4nRRUu0jOLao78sDlcRNZeEUM0nyzHlSjS4Ei',1),(201,'ZAP','ZAP','foo-bar@example.com','$2y$10$0zQ.fmcYVeeyLARcIOCUY.K.omPsu.NaJr87HYJsnWzh1wATqODRC',0),(202,'ZAP','ZAP','foo-bar@example.com','$2y$10$nX/2X5kr14q2/UJ/W7/EvOHQoSSu8wap18uOxCPxktePqGAveno6W',1),(203,'ZAP','ZAP','foo-bar@example.com','$2y$10$Nvv8k3H/qjasSoedyHjKj.MF3zgDMadvPsj3fZqI6nX5a5dIc3yzK',1),(204,'ZAP%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s\n','ZAP','foo-bar@example.com','$2y$10$QMYkGkY8S.2PjBpfbsoWrORTnNfCOccKF/.jHCr.SIZ/9QzSrZIJi',1),(205,'ZAP %1!s%2!s%3!s%4!s%5!s%6!s%7!s%8!s%9!s%10!s%11!s%12!s%13!s%14!s%15!s%16!s%17!s%18!s%19!s%20!s%21!n%22!n%23!n%24!n%25!n%26!n%27!n%28!n%29!n%30!n%31!n%32!n%33!n%34!n%35!n%36!n%37!n%38!n%39!n%40!n\n','ZAP','foo-bar@example.com','$2y$10$cwqi0m2v/Real53UVsooUurSQj6kBDTyN8sEM2S1cvB0IgRkHw/AS',1),(206,'ZAP','ZAP','foo-bar@example.com','$2y$10$M.kFNPS/NNx/mIbu6vzE0.I4V01/.hS5UZHdsYnK1n5OoA40MUIja',1),(207,'ZAP','ZAP%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s\n','foo-bar@example.com','$2y$10$fc68WX2plIWwdCcCxIZ5Q.x5ri2q/4zmscMVa1oUtJxLMBk8ozs3W',1),(208,'ZAP','ZAP %1!s%2!s%3!s%4!s%5!s%6!s%7!s%8!s%9!s%10!s%11!s%12!s%13!s%14!s%15!s%16!s%17!s%18!s%19!s%20!s%21!n%22!n%23!n%24!n%25!n%26!n%27!n%28!n%29!n%30!n%31!n%32!n%33!n%34!n%35!n%36!n%37!n%38!n%39!n%40!n\n','foo-bar@example.com','$2y$10$xE4/Y.fd6z3XpeeJGYWGteftaatkxSI63IkLP.A4Gv9uNiG/fgB8e',1),(209,'ZAP','ZAP','ZAP','$2y$10$zHHwyZbAqWHLshuU/BaToOMtqHLRHVxX.Fuq6TOFh0xWvKlo8gI2e',1),(210,'ZAP','ZAP','ZAP%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s\n','$2y$10$BB4EKFYoJkUUoHLDVNd.beMoCWHq5fFPb1E06zGM7Y5HdTNeXah.q',1),(211,'ZAP','ZAP','ZAP %1!s%2!s%3!s%4!s%5!s%6!s%7!s%8!s%9!s%10!s%11!s%12!s%13!s%14!s%15!s%16!s%17!s%18!s%19!s%20!s%21!n%22!n%23!n%24!n%25!n%26!n%27!n%28!n%29!n%30!n%31!n%32!n%33!n%34!n%35!n%36!n%37!n%38!n%39!n%40!n\n','$2y$10$YJFpflT4UL0HDxltyNzlH.WbLfkBpfj7DrpEBxlEX6fscxf709kKm',1),(212,'ZAP','ZAP','foo-bar@example.com','$2y$10$bSuElMgI2SWnxqRNYaVeJuWGZEyRArg4EOTSJBHS1RiJ/eYgqo8.a',1),(213,'ZAP','ZAP','foo-bar@example.com','$2y$10$bkhN3H2GYLimQXWLponGT.tWooMJqGcWbDt8USp87I1ZFWBElwHBi',1),(214,'ZAP','ZAP','foo-bar@example.com','$2y$10$RmXBhbsUy.I6xO23b9DV4OFJ0.O2RlQeMm0LQOMlZMXkyYaa/0yXG',1),(215,'ZAP','ZAP','foo-bar@example.com','$2y$10$kIRwHJ1Yf3MqPBEyfsonnOTE5bWg4OLCX4M4E4aaLYTYRwxU3Ii0K',0),(216,'ZAP','ZAP','foo-bar@example.com','$2y$10$aPrGJnkBIZIC9hHUR.Sp.uyXabNF6vIJ4yxiNiqITvW9nRDg1GVKm',0),(217,'ZAP','ZAP','foo-bar@example.com','$2y$10$1mHaUzd.DqkYqNqItwACX.M39AvZ4Lh64d7zLp0AJ7ePOaiIsd4dK',0),(218,'ZAP','ZAP','foo-bar@example.com','$2y$10$tj0HFaC7gqJbzWm7nYIt3.Dg5lEZ1PKN17yxlvAw/vXjUpvoNCZQ.',1),(219,'ZAP','ZAP','foo-bar@example.com','$2y$10$71iG4mN28A7foTgBfT/hz.iVXYZ83Ca/B82njAv/oc11D5.wXwBbO',1),(220,'ZAP','ZAP','foo-bar@example.com','$2y$10$9E.KOxhuLltuOl9f/79UAuDb36pWvhBSalAGQENH0lBvgiY/fQBzK',1),(221,'Set-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','ZAP','foo-bar@example.com','$2y$10$bDFafdWO3EwxWkBzGTz2Re/hGnFuPxQ8HAekjnCix5Lhx2qOxsb1i',1),(222,'any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','ZAP','foo-bar@example.com','$2y$10$yz3OHuqAxUtP01NyDsRKy.w.0jy4I57CEiArER3.5st9v6gtLEp.O',1),(223,'any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','ZAP','foo-bar@example.com','$2y$10$hxzjR/g8wMEjFWyTf7CFweoI4h9vSx/.s4ZJ9qDJ7KElEsZx29nzq',1),(224,'any\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','ZAP','foo-bar@example.com','$2y$10$c9/3QkVEGXoYZOvTngnF8enQsGsYPzaEdXKiIxBW8m/4OGuLCjrAK',1),(225,'any?\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','ZAP','foo-bar@example.com','$2y$10$G153q27EtYxaVppyVArwCelQ5eyC251FKB4soFNk/QfAWDmH.cAeW',1),(226,'any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','ZAP','foo-bar@example.com','$2y$10$gtuiOL/9Lx1eWanMf8.8pOk7w59XiFTAVDK.JMwU5kZbk7ADyLW8O',1),(227,'any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','ZAP','foo-bar@example.com','$2y$10$p8UH633MYtxyO5.xdAZUT.8nuVfMQ2nDXF6.POhXfSCQjdn1Apyrm',1),(228,'ZAP','Set-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','foo-bar@example.com','$2y$10$kjDQQpR0nGAMCwh6YUYRBOLFu9YuiYb9mbwONv2ceFkN3SKzbFckG',1),(229,'ZAP','any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','foo-bar@example.com','$2y$10$N/6vVgTsPa07NEum4k6rLeYwEhhtt2xxU/eYXlluWcGixsAzgV1f.',1),(230,'ZAP','any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','foo-bar@example.com','$2y$10$ObCvFQniyYM/TnLviiYgeuc1fo4bvP0wWfAjBC7La2XIoD1tT0PKa',1),(231,'ZAP','any\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','foo-bar@example.com','$2y$10$BvPgK/JmEG8XKq0ybCKNO.nOgGzpLQ5FCqFRSP9J9QoclRuc4zM2a',1),(232,'ZAP','any?\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','foo-bar@example.com','$2y$10$vrl5jZp01prxwEeDiLc7NOiOFn3wIJLggmSyYEJn4kOkaR0RLQMAi',1),(233,'ZAP','any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','foo-bar@example.com','$2y$10$BbgcGKQBu/X9GJT1zIMmku/HPy.M5f9Ub.YWAXnk7bhJhVIywen5S',1),(234,'ZAP','any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','foo-bar@example.com','$2y$10$sLAJNTSpRf45scE0v9frvuGE/hEXEbZfQcG6X7H4lQVCxrlhoWDqm',1),(235,'ZAP','ZAP','Set-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','$2y$10$TxdPuF60R8xYIrjt4RzvK.N93ZwrXNdpoLZKzfOMnet5us8.zbFOW',1),(236,'ZAP','ZAP','any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','$2y$10$jAx2s1YdC8/DRaNQ50RY4.UvKB7pkL.Sm5E2eKYaNtgNgFiVIg0Ea',1),(237,'ZAP','ZAP','any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','$2y$10$Lw/iVMgMaPXD.oFp/OCJo.ni3nOzrxlfEdTSP404Xzbmj08fr5mAm',1),(238,'ZAP','ZAP','any\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','$2y$10$JTTaUH.W9rfzJFuJ5IOqYuHZb8dSAsU51Uw2K.cSLjAudr95jxGRK',1),(239,'ZAP','ZAP','any?\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa','$2y$10$n2eb52gy/sa3Inswie7auuCXw7IJcfUpfepGZdS3KYFfgXXZRtwZW',1),(240,'ZAP','ZAP','any\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','$2y$10$T5L2yYjLaoh5QnCmbEeEsuAXv8ML7L7gsO.erX7HTu3sZh31W/ts.',1),(241,'ZAP','ZAP','any?\r\nSet-cookie: Tamper=ae65ae74-5d94-439f-b5ba-10099c579daa\r\n','$2y$10$a8jAMIhu72sxNULq4ry58uer0c/0RAAlwXAKdgXrIvQXVKFUSKRHm',1),(242,'ZAP','ZAP','foo-bar@example.com','$2y$10$2EQG7vIsN8Ee266KyBVo1OLCeRZQMQUyhu8v.0DEXM1G/BO7XyxdO',1),(243,'ZAP','ZAP','foo-bar@example.com','$2y$10$Lc1roq.cOx0p3KWAX6siQOV11W7EUEaylSzjn7oOH/6W73k665X06',1),(244,'ZAP','ZAP','foo-bar@example.com','$2y$10$R0CPQ5Pm8JMInVLqX0mOcOrRg0lA1X0wpwuKzjZOVXoBm60AZvgNO',1),(245,'ZAP','ZAP','foo-bar@example.com','$2y$10$TJmBadF377ygJmdMYaXzN.zeb1uFiAmeStnmBimV0XAT5mrRZFMNW',1),(246,'ZAP','ZAP','foo-bar@example.com','$2y$10$9A1KN9M/GmUErhA3QZ3eMuxUQEw0nvHCXE1IfPpi1EfnLDH8u8Vp.',1),(247,'ZAP','ZAP','foo-bar@example.com','$2y$10$Efr/7awj1wo/PPn6eR06g.8HawedKtRrhwV1vqzqcRNrLDWFK93ia',1),(248,'ZAP','ZAP','foo-bar@example.com','$2y$10$WEZfXAy9lHk4KpAhrkM7XuoFayL0kWi.VNraSbykSikAs6b39A8Wu',1),(249,'ZAP','ZAP','foo-bar@example.com','$2y$10$gvKbf0y7iiWX8fel8ZZ.H.hrmARxmjuGVFx2j4Jw4b2FQ7Nn134SS',0),(250,'ZAP','ZAP','foo-bar@example.com','$2y$10$1hH8ldSy1hymjSb.yDWyG.8QD9x8gBzN8L2WvWjMSoiO.DDzgEEKK',0),(251,'ZAP','ZAP','foo-bar@example.com','$2y$10$WsY80U/mkZD8weixnI88Cu6wIfmPDDuwt2AF3tzaof9msjTw9vZOO',0),(252,'ZAP','ZAP','foo-bar@example.com','$2y$10$k6unz3xgfiQbzo/2BxoX9.p21hEIeIzqUCAB2htPV74cvSJxt6KVS',0),(253,'ZAP','ZAP','foo-bar@example.com','$2y$10$P.vc8fC0Zgk4FhelA03GO.1lNlKDE2WM5RxCf5f33Pq5vz.GZGrX.',0),(254,'ZAP','ZAP','foo-bar@example.com','$2y$10$gTrYkm4NoWx3bXiutPOfWOyBoz.jpBCFRyyPySpJT1h5YLPKidKmi',0),(255,'ZAP','ZAP','foo-bar@example.com','$2y$10$IaRLgnsJssTnfE0PIG5xXerXywj41VRcuuFYmt6tkI4DlQ1O858MO',0),(256,'ZAP','ZAP','foo-bar@example.com','$2y$10$dnd0ycVxO1eg0D23prifOOFLTRHFeXiMa7ZCfuS48GPXYzohm65Le',1),(257,'ZAP','ZAP','foo-bar@example.com','$2y$10$w76W5uw9lU.1RASdJQt/g.LYadzoN9oB0p6v0XYRCuHf.EYKNTG9S',1),(258,'ZAP','ZAP','foo-bar@example.com','$2y$10$5OEt7oIPy0/91J26qZWpEeubPXcSme/r4sOLtmRjP6PuBN7cDNdyW',1),(259,'ZAP','ZAP','foo-bar@example.com','$2y$10$yhq.sYYbh3v.BrqXEfBuKeR1ya2yVm/ET9JuKW9JuKXBzLvRjCFqW',1),(260,'ZAP','ZAP','foo-bar@example.com','$2y$10$WNVfkehKppkH322bH3RfKukUBetkLnIfGBihfzwv9v52X0Tk/B8rW',1),(261,'ZAP','ZAP','foo-bar@example.com','$2y$10$X6lRtQzIFIJhiRxigDl1n.ogYWqH.50H2HBm4JNNywXRSMkWWOBKu',1),(262,'ZAP','ZAP','foo-bar@example.com','$2y$10$LtoM2sDOxy8q1eoULbWzSuO.J4ao6jjOveFs/0WhQi1Ksim7vmaBa',1),(263,'ZAP','ZAP','foo-bar@example.com','$2y$10$ofD3ENroBEGtnvMQnfR7cOyKhTF8wrXsSkvwmCKfsMqdFNf.MDWue',1),(264,'','ZAP','foo-bar@example.com','$2y$10$AGzJZYEC4.G/Eh0Q2xba/ewJjQqYyHNeWLv1LOpUDlYPw1ZWuycrW',1),(265,'ZAP','ZAP','foo-bar@example.com','$2y$10$Pgco5BAWuNnMBWjvq3ykcetF4EddAICVgH9Zerp1sd4ko9VUgCf7K',1),(266,'ZAP','','foo-bar@example.com','$2y$10$L.mWnp6pi.5LVMcMQUBV9.8opzkjzQj3D0r27dWgaWLbJaO4lj1n6',1),(267,'ZAP','ZAP','foo-bar@example.com','$2y$10$zsDS5FtlTTwTjK2/qrHLweYa2lQ0Ft.w1ne5bv27Ialxh4Bv65U8a',1),(268,'ZAP','ZAP','','$2y$10$mYKh8PyXceevG67DFaa6cejhZEuszVpjQfnbqMCT81/WdkglQ5ydq',1),(269,'ZAP','ZAP','foo-bar@example.com','$2y$10$gvNRAAlPWn.y61R.C7q9Ee/mQK1pnvUXXQnDGTcdmEFuYZP/86BIO',1),(270,'ZAP','ZAP','foo-bar@example.com','$2y$10$2Mmg9XvGyEsZM5Q9XgWTy.bdSwK6pyDu90vrX3Uvt0NuYXIFgE6TG',1),(271,'ZAP','ZAP','foo-bar@example.com','$2y$10$.IXq7rkiRXmBTLAMXVISYunzjbRLXdoy9YT4IZ8DAYPq3ItHgQr2u',1),(272,'ZAP','ZAP','foo-bar@example.com','$2y$10$321lkt/y8sQIOyrKBH8hOufVq4BfBM4chpYYk3C/CeKNiKfAr0Oai',0),(273,'ZAP','ZAP','foo-bar@example.com','$2y$10$FiyTemTfN6PmkHSsWWJAI.YI2Ifz6yVq4xxkGLyPmqJSWlaN25jLG',1),(274,'ZAP','ZAP','foo-bar@example.com','$2y$10$aac/7iXT2BBsAy/a/nOvEek3XjOJGk5wi6s0BNSU6bsfxqHnj9fNK',1),(275,'ZAP','ZAP','foo-bar@example.com','$2y$10$Yk4zRjN0wBLQBJ.vfhu3MOx6/52oxD/LeT5KjC9R0UvKjeVl4c7fm',1),(276,'ZAP','ZAP','foo-bar@example.com','$2y$10$jNsHRFDQD82PIQztZc.zaOQTe8dMOMXqRbpbmpj1SE5ZQPg9HGIBS',1),(277,'ZAP','ZAP','foo-bar@example.com','$2y$10$KFng83kd13KR/14GxtbGHe.lRE5Zx.layYYXpL4D4Vd7k9gVBR27.',1),(278,'ZAP','ZAP','foo-bar@example.com','$2y$10$0/WoPjTFyoCcvrd4fBkwrO995El9x5mKvTB8SWgTiSdrhTJGE5jyO',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `price` double(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct`
--

LOCK TABLES `tblproduct` WRITE;
/*!40000 ALTER TABLE `tblproduct` DISABLE KEYS */;
INSERT INTO `tblproduct` VALUES (1,'FinePix Pro2 3D Camera','3DcAM01','img/product-images/camera.jpg',1500.00),(2,'EXP Portable Hard Drive','USB02','img/product-images/external-hard-drive.jpg',800.00),(3,'Luxury Ultra thin Wrist Watch','wristWear03','img/product-images/watch.jpg',300.00),(4,'XP 1155 Intel Core Laptop','LPN45','img/product-images/laptop.jpg',800.00);
/*!40000 ALTER TABLE `tblproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 14:19:41
