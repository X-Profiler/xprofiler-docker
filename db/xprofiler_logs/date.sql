-- database: xprofiler_logs

-- daily process
DROP TABLE IF EXISTS `process_01`;
DROP TABLE IF EXISTS `process_02`;
DROP TABLE IF EXISTS `process_03`;
DROP TABLE IF EXISTS `process_04`;
DROP TABLE IF EXISTS `process_05`;
DROP TABLE IF EXISTS `process_06`;
DROP TABLE IF EXISTS `process_07`;
DROP TABLE IF EXISTS `process_08`;
DROP TABLE IF EXISTS `process_09`;
DROP TABLE IF EXISTS `process_10`;
DROP TABLE IF EXISTS `process_11`;
DROP TABLE IF EXISTS `process_12`;
DROP TABLE IF EXISTS `process_13`;
DROP TABLE IF EXISTS `process_14`;
DROP TABLE IF EXISTS `process_15`;
DROP TABLE IF EXISTS `process_16`;
DROP TABLE IF EXISTS `process_17`;
DROP TABLE IF EXISTS `process_18`;
DROP TABLE IF EXISTS `process_19`;
DROP TABLE IF EXISTS `process_20`;
DROP TABLE IF EXISTS `process_21`;
DROP TABLE IF EXISTS `process_22`;
DROP TABLE IF EXISTS `process_23`;
DROP TABLE IF EXISTS `process_24`;
DROP TABLE IF EXISTS `process_25`;
DROP TABLE IF EXISTS `process_26`;
DROP TABLE IF EXISTS `process_27`;
DROP TABLE IF EXISTS `process_28`;
DROP TABLE IF EXISTS `process_29`;
DROP TABLE IF EXISTS `process_30`;
DROP TABLE IF EXISTS `process_31`;
CREATE TABLE process_01 LIKE process;
CREATE TABLE process_02 LIKE process;
CREATE TABLE process_03 LIKE process;
CREATE TABLE process_04 LIKE process;
CREATE TABLE process_05 LIKE process;
CREATE TABLE process_06 LIKE process;
CREATE TABLE process_07 LIKE process;
CREATE TABLE process_08 LIKE process;
CREATE TABLE process_09 LIKE process;
CREATE TABLE process_10 LIKE process;
CREATE TABLE process_11 LIKE process;
CREATE TABLE process_12 LIKE process;
CREATE TABLE process_13 LIKE process;
CREATE TABLE process_14 LIKE process;
CREATE TABLE process_15 LIKE process;
CREATE TABLE process_16 LIKE process;
CREATE TABLE process_17 LIKE process;
CREATE TABLE process_18 LIKE process;
CREATE TABLE process_19 LIKE process;
CREATE TABLE process_20 LIKE process;
CREATE TABLE process_21 LIKE process;
CREATE TABLE process_22 LIKE process;
CREATE TABLE process_23 LIKE process;
CREATE TABLE process_24 LIKE process;
CREATE TABLE process_25 LIKE process;
CREATE TABLE process_26 LIKE process;
CREATE TABLE process_27 LIKE process;
CREATE TABLE process_28 LIKE process;
CREATE TABLE process_29 LIKE process;
CREATE TABLE process_30 LIKE process;
CREATE TABLE process_31 LIKE process;

-- daily osinfo
DROP TABLE IF EXISTS `osinfo_01`;
DROP TABLE IF EXISTS `osinfo_02`;
DROP TABLE IF EXISTS `osinfo_03`;
DROP TABLE IF EXISTS `osinfo_04`;
DROP TABLE IF EXISTS `osinfo_05`;
DROP TABLE IF EXISTS `osinfo_06`;
DROP TABLE IF EXISTS `osinfo_07`;
DROP TABLE IF EXISTS `osinfo_08`;
DROP TABLE IF EXISTS `osinfo_09`;
DROP TABLE IF EXISTS `osinfo_10`;
DROP TABLE IF EXISTS `osinfo_11`;
DROP TABLE IF EXISTS `osinfo_12`;
DROP TABLE IF EXISTS `osinfo_13`;
DROP TABLE IF EXISTS `osinfo_14`;
DROP TABLE IF EXISTS `osinfo_15`;
DROP TABLE IF EXISTS `osinfo_16`;
DROP TABLE IF EXISTS `osinfo_17`;
DROP TABLE IF EXISTS `osinfo_18`;
DROP TABLE IF EXISTS `osinfo_19`;
DROP TABLE IF EXISTS `osinfo_20`;
DROP TABLE IF EXISTS `osinfo_21`;
DROP TABLE IF EXISTS `osinfo_22`;
DROP TABLE IF EXISTS `osinfo_23`;
DROP TABLE IF EXISTS `osinfo_24`;
DROP TABLE IF EXISTS `osinfo_25`;
DROP TABLE IF EXISTS `osinfo_26`;
DROP TABLE IF EXISTS `osinfo_27`;
DROP TABLE IF EXISTS `osinfo_28`;
DROP TABLE IF EXISTS `osinfo_29`;
DROP TABLE IF EXISTS `osinfo_30`;
DROP TABLE IF EXISTS `osinfo_31`;
CREATE TABLE osinfo_01 LIKE osinfo;
CREATE TABLE osinfo_02 LIKE osinfo;
CREATE TABLE osinfo_03 LIKE osinfo;
CREATE TABLE osinfo_04 LIKE osinfo;
CREATE TABLE osinfo_05 LIKE osinfo;
CREATE TABLE osinfo_06 LIKE osinfo;
CREATE TABLE osinfo_07 LIKE osinfo;
CREATE TABLE osinfo_08 LIKE osinfo;
CREATE TABLE osinfo_09 LIKE osinfo;
CREATE TABLE osinfo_10 LIKE osinfo;
CREATE TABLE osinfo_11 LIKE osinfo;
CREATE TABLE osinfo_12 LIKE osinfo;
CREATE TABLE osinfo_13 LIKE osinfo;
CREATE TABLE osinfo_14 LIKE osinfo;
CREATE TABLE osinfo_15 LIKE osinfo;
CREATE TABLE osinfo_16 LIKE osinfo;
CREATE TABLE osinfo_17 LIKE osinfo;
CREATE TABLE osinfo_18 LIKE osinfo;
CREATE TABLE osinfo_19 LIKE osinfo;
CREATE TABLE osinfo_20 LIKE osinfo;
CREATE TABLE osinfo_21 LIKE osinfo;
CREATE TABLE osinfo_22 LIKE osinfo;
CREATE TABLE osinfo_23 LIKE osinfo;
CREATE TABLE osinfo_24 LIKE osinfo;
CREATE TABLE osinfo_25 LIKE osinfo;
CREATE TABLE osinfo_26 LIKE osinfo;
CREATE TABLE osinfo_27 LIKE osinfo;
CREATE TABLE osinfo_28 LIKE osinfo;
CREATE TABLE osinfo_29 LIKE osinfo;
CREATE TABLE osinfo_30 LIKE osinfo;
CREATE TABLE osinfo_31 LIKE osinfo;

-- daily alarm
DROP TABLE IF EXISTS `alarm_01`;
DROP TABLE IF EXISTS `alarm_02`;
DROP TABLE IF EXISTS `alarm_03`;
DROP TABLE IF EXISTS `alarm_04`;
DROP TABLE IF EXISTS `alarm_05`;
DROP TABLE IF EXISTS `alarm_06`;
DROP TABLE IF EXISTS `alarm_07`;
DROP TABLE IF EXISTS `alarm_08`;
DROP TABLE IF EXISTS `alarm_09`;
DROP TABLE IF EXISTS `alarm_10`;
DROP TABLE IF EXISTS `alarm_11`;
DROP TABLE IF EXISTS `alarm_12`;
DROP TABLE IF EXISTS `alarm_13`;
DROP TABLE IF EXISTS `alarm_14`;
DROP TABLE IF EXISTS `alarm_15`;
DROP TABLE IF EXISTS `alarm_16`;
DROP TABLE IF EXISTS `alarm_17`;
DROP TABLE IF EXISTS `alarm_18`;
DROP TABLE IF EXISTS `alarm_19`;
DROP TABLE IF EXISTS `alarm_20`;
DROP TABLE IF EXISTS `alarm_21`;
DROP TABLE IF EXISTS `alarm_22`;
DROP TABLE IF EXISTS `alarm_23`;
DROP TABLE IF EXISTS `alarm_24`;
DROP TABLE IF EXISTS `alarm_25`;
DROP TABLE IF EXISTS `alarm_26`;
DROP TABLE IF EXISTS `alarm_27`;
DROP TABLE IF EXISTS `alarm_28`;
DROP TABLE IF EXISTS `alarm_29`;
DROP TABLE IF EXISTS `alarm_30`;
DROP TABLE IF EXISTS `alarm_31`;
CREATE TABLE alarm_01 LIKE alarm;
CREATE TABLE alarm_02 LIKE alarm;
CREATE TABLE alarm_03 LIKE alarm;
CREATE TABLE alarm_04 LIKE alarm;
CREATE TABLE alarm_05 LIKE alarm;
CREATE TABLE alarm_06 LIKE alarm;
CREATE TABLE alarm_07 LIKE alarm;
CREATE TABLE alarm_08 LIKE alarm;
CREATE TABLE alarm_09 LIKE alarm;
CREATE TABLE alarm_10 LIKE alarm;
CREATE TABLE alarm_11 LIKE alarm;
CREATE TABLE alarm_12 LIKE alarm;
CREATE TABLE alarm_13 LIKE alarm;
CREATE TABLE alarm_14 LIKE alarm;
CREATE TABLE alarm_15 LIKE alarm;
CREATE TABLE alarm_16 LIKE alarm;
CREATE TABLE alarm_17 LIKE alarm;
CREATE TABLE alarm_18 LIKE alarm;
CREATE TABLE alarm_19 LIKE alarm;
CREATE TABLE alarm_20 LIKE alarm;
CREATE TABLE alarm_21 LIKE alarm;
CREATE TABLE alarm_22 LIKE alarm;
CREATE TABLE alarm_23 LIKE alarm;
CREATE TABLE alarm_24 LIKE alarm;
CREATE TABLE alarm_25 LIKE alarm;
CREATE TABLE alarm_26 LIKE alarm;
CREATE TABLE alarm_27 LIKE alarm;
CREATE TABLE alarm_28 LIKE alarm;
CREATE TABLE alarm_29 LIKE alarm;
CREATE TABLE alarm_30 LIKE alarm;
CREATE TABLE alarm_31 LIKE alarm;
