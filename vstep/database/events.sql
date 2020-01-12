/*
 Navicat Premium Data Transfer

 Source Server         : GreenStep
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : vstep

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 12/01/2020 11:37:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time(0) NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time(0) NOT NULL,
  `distance` double NULL DEFAULT NULL,
  `step_amount` bigint(20) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\"pending\"',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `start_point` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `end_point` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, '[\"events\\\\January2020\\\\5JsfpkIcgZfwJoU6uxpK.jpg\",\"events\\\\January2020\\\\hGEuT26ETqxx5VnedKWq.jpg\",\"events\\\\January2020\\\\7g6rjQPEo7gKwo6T5ej4.jpg\"]', 'Event 1', 'Can Tho', 'this is the description number 1', 'step', '2020-01-20', '00:00:00', '2020-01-20', '13:00:00', NULL, 10000, 'pending', 1, NULL, '2020-01-11 16:15:00', '2020-01-11 15:52:12', NULL, NULL);
INSERT INTO `events` VALUES (2, '[\"events\\\\January2020\\\\ajTD48DS9ZkzoaF6D5oH.jpg\",\"events\\\\January2020\\\\LodmtVC0dJcSh1QX9TsS.jpg\",\"events\\\\January2020\\\\12BQAs9i5E0SZn02tp3W.jpg\"]', 'Run for the environment', 'Hoan Kiem, Ha Noi', 'Run for the environment', 'step', '2020-10-29', '07:00:00', '2019-11-03', '19:00:00', NULL, 10000, 'ended', 1, NULL, '2020-01-11 22:02:00', '2020-01-12 09:57:12', NULL, NULL);
INSERT INTO `events` VALUES (3, '[\"events\\\\January2020\\\\C4U2gkKieLAYlucOgZyK.jpg\",\"events\\\\January2020\\\\XkMo8ZNTTvX6CYC0a1mc.jpg\",\"events\\\\January2020\\\\vjbRFrmiC5U7vLKxvx25.jpg\"]', 'Green Step', 'Ba Dinh, Ha Noi', 'Make the world green', 'time', '2020-10-10', '07:00:00', '2019-11-15', '17:00:00', 20, NULL, 'ended', 2, 1, '2020-01-11 22:09:00', '2020-01-12 09:57:12', NULL, NULL);
INSERT INTO `events` VALUES (4, NULL, 'Testing', NULL, '<p>ZABSDA</p>', 'martathon', '2020-01-03', '13:00:00', '2020-01-04', '01:01:00', 200, NULL, 'pending', 1, NULL, '2020-01-12 11:30:21', '2020-01-12 11:30:21', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
