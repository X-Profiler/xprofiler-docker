CREATE DATABASE IF NOT EXISTS `xprofiler_console` character SET utf8mb4;
CREATE DATABASE IF NOT EXISTS `xprofiler_logs` character SET utf8mb4;

USE xprofiler_console;
CREATE TABLE IF NOT EXISTS `user`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `name` VARCHAR(100) NOT NULL COMMENT 'user name',
  `nick` VARCHAR(100) NOT NULL COMMENT 'user nick name',
  `pass` VARCHAR(200) NOT NULL COMMENT 'user pass key',
  `identity` VARCHAR(20) NOT NULL COMMENT 'user identity sign',
  `mail` VARCHAR(250) NOT NULL COMMENT 'user mail address',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`),
  UNIQUE KEY (`identity`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'user info table';

CREATE TABLE IF NOT EXISTS `apps`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `name` VARCHAR(50) NOT NULL COMMENT 'app name',
  `owner` INT UNSIGNED NOT NULL COMMENT 'owner user unique id',
  `secret` VARCHAR(50) NOT NULL COMMENT 'app secret key',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`owner`, `name`),
  INDEX (`owner`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'app info table';

CREATE TABLE IF NOT EXISTS `members`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `app` INT UNSIGNED NOT NULL COMMENT 'app unique id',
  `user` INT UNSIGNED NOT NULL COMMENT 'user unique id',
  `status` INT UNSIGNED NOT NULL COMMENT '1: inviting, 2: joined',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`app`, `user`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'app members info table';

CREATE TABLE IF NOT EXISTS `files`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `app` INT NOT NULL COMMENT 'app unique id',
  `agent` VARCHAR(50) NOT NULL COMMENT 'agent name',
  `type` VARCHAR(50) NOT NULL COMMENT 'file type',
  `file` VARCHAR(250) NOT NULL COMMENT 'file path',
  `storage` VARCHAR(250) DEFAULT "" COMMENT 'file storage path with custom',
  `user` INT UNSIGNED NOT NULL COMMENT 'user unique id',
  `status` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:creating, 1:created, 2:transferring, 3:transferred',
  `favor` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:not favor, 1:has favor',
  `token` VARCHAR(50) DEFAULT "" COMMENT 'file token',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`app`, `agent`, `file`, `storage`),
  INDEX (`id`, `app`, `type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'analyse file info table';

CREATE TABLE IF NOT EXISTS `coredumps`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `app` INT NOT NULL COMMENT 'app unique id',
  `agent` VARCHAR(50) NOT NULL COMMENT 'agent name',
  `file` VARCHAR(250) NOT NULL COMMENT 'file path',
  `file_storage` VARCHAR(250) DEFAULT "" COMMENT 'file storage with custom',
  `file_status` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:creating, 1:created, 2:transferring, 3:transferred',
  `node` VARCHAR(250) NOT NULL COMMENT 'node path',
  `node_storage` VARCHAR(250) DEFAULT "" COMMENT 'node name',
  `node_status` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:creating, 1:created, 2:transferring, 3:transferred',
  `user` INT UNSIGNED NOT NULL COMMENT 'user unique id',
  `favor` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:not favor, 1:has favor',
  `token` VARCHAR(50) DEFAULT "" COMMENT 'file token',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`app`, `agent`, `file`, `file_storage`),
  INDEX (`id`, `app`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'coredumps info table';

CREATE TABLE IF NOT EXISTS `strategies`(
 `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
 `app` INT NOT NULL COMMENT 'app unique id',
 `context` VARCHAR(50) NOT NULL COMMENT 'context type',
 `push` VARCHAR(50) NOT NULL COMMENT 'push level',
 `webhook` TINYINT UNSIGNED DEFAULT 0 COMMENT '0:close, 1:open',
 `wtype` VARCHAR(20) DEFAULT '' COMMENT 'webhook type',
 `waddress` VARCHAR(200) DEFAULT '' COMMENT 'webhook address',
 `wsign` VARCHAR(100) DEFAULT '' COMMENT 'webhook sign',
 `expression` VARCHAR(150) NOT NULL COMMENT 'alarm expression',
 `content` VARCHAR(150) NOT NULL COMMENT 'alarm content',
 `status` TINYINT UNSIGNED DEFAULT 1 COMMENT '0:disable, 1:enable',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  INDEX (`id`, `app`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'strategies info table';

CREATE TABLE IF NOT EXISTS `contacts`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `strategy` INT UNSIGNED NOT NULL COMMENT 'strategy unique id',
  `user` INT UNSIGNED NOT NULL COMMENT 'user unique id',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`strategy`, `user`),
  INDEX (`strategy`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'strategy contacts info table';

USE xprofiler_logs;
CREATE TABLE IF NOT EXISTS `process`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `app` INT NOT NULL COMMENT 'app id',
  `agent` VARCHAR(50) NOT NULL COMMENT 'agent name',
  `pid` INT NOT NULL COMMENT 'process id',
  `uptime` INT UNSIGNED COMMENT 'process uptime (sec)',
  `log_time` DATETIME NOT NULL COMMENT 'process log created time on agent',
  `version` VARCHAR(50) NOT NULL COMMENT 'xprofiler version',

  `cpu_now` FLOAT(5,2) COMMENT 'current process cpu usage (0-100%)',
  `cpu_15` FLOAT(5,2) COMMENT 'process cpu usage in last 15 sec (0-100%)',
  `cpu_30` FLOAT(5,2) COMMENT 'process cpu usage in last 30 sec (0-100%)',
  `cpu_60` FLOAT(5,2) COMMENT 'process cpu usage in last 60 sec (0-100%)',

  `rss` BIGINT COMMENT 'resident set size (byte)',
  `heap_used` BIGINT UNSIGNED COMMENT 'heap used (byte)',
  `heap_available` BIGINT UNSIGNED COMMENT 'heap available (byte)',
  `heap_total` BIGINT UNSIGNED COMMENT 'heap total (byte)',
  `heap_limit` BIGINT UNSIGNED COMMENT 'heap limit (byte)',
  `heap_executeable` BIGINT UNSIGNED COMMENT 'heap executeable (byte)',
  `total_physical_size` BIGINT UNSIGNED COMMENT 'heap executeable (byte)',
  `malloced_memory` BIGINT UNSIGNED COMMENT 'malloced memory (byte)',
  `amount_of_external_allocated_memory` BIGINT UNSIGNED COMMENT 'external allocated memory (byte)',
  `new_space_size` BIGINT UNSIGNED COMMENT 'new space total (byte)',
  `new_space_used` BIGINT UNSIGNED COMMENT 'new space used (byte)',
  `new_space_available` BIGINT UNSIGNED COMMENT 'new space available (byte)',
  `new_space_committed` BIGINT UNSIGNED COMMENT 'new space actually applies for physical memory (byte)',
  `old_space_size` BIGINT UNSIGNED COMMENT 'old space total (byte)',
  `old_space_used` BIGINT UNSIGNED COMMENT 'old space used (byte)',
  `old_space_available` BIGINT UNSIGNED COMMENT 'old space available (byte)',
  `old_space_committed` BIGINT UNSIGNED COMMENT 'old space actually applies for physical memory (byte)',
  `code_space_size` BIGINT UNSIGNED COMMENT 'code space total (byte)',
  `code_space_used` BIGINT UNSIGNED COMMENT 'code space used (byte)',
  `code_space_available` BIGINT UNSIGNED COMMENT 'code space available (byte)',
  `code_space_committed` BIGINT UNSIGNED COMMENT 'code space actually applies for physical memory (byte)',
  `map_space_size` BIGINT UNSIGNED COMMENT 'hidden class space total (byte)',
  `map_space_used` BIGINT UNSIGNED COMMENT 'hidden class space used (byte)',
  `map_space_available` BIGINT UNSIGNED COMMENT 'hidden class space available (byte)',
  `map_space_committed` BIGINT UNSIGNED COMMENT 'hidden class space actually applies for physical memory (byte)',
  `lo_space_size` BIGINT UNSIGNED COMMENT 'large object space total (byte)',
  `lo_space_used` BIGINT UNSIGNED COMMENT 'large object space used (byte)',
  `lo_space_available` BIGINT UNSIGNED COMMENT 'large object space available (byte)',
  `lo_space_committed` BIGINT UNSIGNED COMMENT 'large object space actually applies for physical memory (byte)',
  `read_only_space_size` BIGINT UNSIGNED COMMENT 'read only space total (byte)',
  `read_only_space_used` BIGINT UNSIGNED COMMENT 'read only space used (byte)',
  `read_only_space_available` BIGINT UNSIGNED COMMENT 'read onlyread only space available (byte)',
  `read_only_space_committed` BIGINT UNSIGNED COMMENT 'read only space actually applies for physical memory (byte)',
  `new_lo_space_size` BIGINT UNSIGNED COMMENT 'new large object space total (byte)',
  `new_lo_space_used` BIGINT UNSIGNED COMMENT 'new large object space used (byte)',
  `new_lo_space_available` BIGINT UNSIGNED COMMENT 'new large object space available (byte)',
  `new_lo_space_committed` BIGINT UNSIGNED COMMENT 'new large object space actually applies for physical memory (byte)',
  `code_lo_space_size` BIGINT UNSIGNED COMMENT 'code large object space total (byte)',
  `code_lo_space_used` BIGINT UNSIGNED COMMENT 'code large object space used (byte)',
  `code_lo_space_available` BIGINT UNSIGNED COMMENT 'code large object space available (byte)',
  `code_lo_space_committed` BIGINT UNSIGNED COMMENT 'code large object space actually applies for physical memory (byte)',

  `total_gc_times` INT UNSIGNED COMMENT 'total count of gc',
  `total_gc_duration` INT UNSIGNED COMMENT 'total duration of gc',
  `total_scavange_duration` INT UNSIGNED COMMENT 'total scavange duration of gc',
  `total_marksweep_duration` INT UNSIGNED COMMENT 'total marksweep duration of gc',
  `total_incremental_marking_duration` INT UNSIGNED COMMENT 'total incremental marking duration of gc',
  `gc_time_during_last_record` INT UNSIGNED COMMENT 'duration of last gc',
  `scavange_duration_last_record` INT UNSIGNED COMMENT 'scavange duration of last gc',
  `marksweep_duration_last_record` INT UNSIGNED COMMENT 'marksweep duration of last gc',
  `incremental_marking_duration_last_record` INT UNSIGNED COMMENT 'incremental marking duration of last gc',

  `active_handles` INT UNSIGNED COMMENT 'active and reference Libuv handles',
  `active_file_handles` INT UNSIGNED COMMENT 'active file handles',
  `active_and_ref_file_handles` INT UNSIGNED COMMENT 'active and reference file handles',
  `active_tcp_handles` INT UNSIGNED COMMENT 'active tcp handles',
  `active_and_ref_tcp_handles` INT UNSIGNED COMMENT 'active and reference tcp handles',
  `active_udp_handles` INT UNSIGNED COMMENT 'active udp handles',
  `active_and_ref_udp_handles` INT UNSIGNED COMMENT 'active and reference udp handles',
  `active_timer_handles` INT UNSIGNED COMMENT 'active timer handles',
  `active_and_ref_timer_handles`  INT UNSIGNED COMMENT 'active and reference timer handles',

  `response_codes` VARCHAR(1024) DEFAULT '' COMMENT 'responese codes and count',
  `live_http_request` INT UNSIGNED COMMENT 'live http requests in last 1 min',
  `http_response_close` INT UNSIGNED COMMENT 'http connections close in last 1 min',
  `http_response_sent` INT UNSIGNED COMMENT 'http responeses sent in last 1 min',
  `http_request_timeout` INT UNSIGNED COMMENT 'timeout http requests in last 1 min',
  `http_patch_timeout` INT UNSIGNED COMMENT 'http patch timeout (s)',
  `http_rt` DOUBLE COMMENT 'http average response time (ms)',

  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  INDEX (`app`, `agent`, `pid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'process info table';

CREATE TABLE IF NOT EXISTS `osinfo`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `app` INT NOT NULL COMMENT 'app id',
  `agent` VARCHAR(50) NOT NULL COMMENT 'agent name',
  `uptime` INT UNSIGNED NOT NULL COMMENT 'system uptime',
  `log_time` DATETIME NOT NULL COMMENT 'system log created time on agent',
  `position` TINYINT UNSIGNED NOT NULL COMMENT '0: from system_log, 1: from xprofiler_log',
  `version` VARCHAR(50) DEFAULT '' COMMENT 'xprofiler version',

  `used_cpu` DOUBLE COMMENT 'cpu usage (0-100%)',
  `cpu_count` INT UNSIGNED COMMENT 'cpu count',

  `total_memory` BIGINT UNSIGNED COMMENT 'os total memory (byte)',
  `free_memory` BIGINT UNSIGNED COMMENT 'os free memory (byte)',

  `load1` DOUBLE COMMENT 'os load in last 1 min',
  `load5` DOUBLE COMMENT 'os load in last 5 min',
  `load15` DOUBLE COMMENT 'os load in last 15 min',

  `disks` VARCHAR(1024) COMMENT 'monitored disks directory and usage (0-100%)',

  `node_count` INT UNSIGNED COMMENT 'node process count',

  `total_gc_times` INT UNSIGNED COMMENT 'total count of gc (all process)',
  `total_gc_duration` INT UNSIGNED COMMENT 'total duration of gc (all process)',
  `total_scavange_duration` INT UNSIGNED COMMENT 'total scavange duration of gc (all process)',
  `total_marksweep_duration` INT UNSIGNED COMMENT 'total marksweep duration of gc (all process)',
  `total_incremental_marking_duration` INT UNSIGNED COMMENT 'total incremental marking duration of gc (all process)',
  `gc_time_during_last_record` INT UNSIGNED COMMENT 'duration of last gc (all process)',
  `scavange_duration_last_record` INT UNSIGNED COMMENT 'scavange duration of last gc (all process)',
  `marksweep_duration_last_record` INT UNSIGNED COMMENT 'marksweep duration of last gc (all process)',
  `incremental_marking_duration_last_record` INT UNSIGNED COMMENT 'incremental marking duration of last gc (all process)',

  `response_codes` VARCHAR(1024) DEFAULT '' COMMENT 'responese codes and count',
  `live_http_request` INT UNSIGNED COMMENT 'live http requests in last 1 min',
  `http_response_close` INT UNSIGNED COMMENT 'http connections close in last 1 min',
  `http_response_sent` INT UNSIGNED COMMENT 'http responeses sent in last 1 min',
  `http_request_timeout` INT UNSIGNED COMMENT 'timeout http requests in last 1 min',
  `http_patch_timeout` INT UNSIGNED COMMENT 'http patch timeout (s)',
  `http_rt` DOUBLE COMMENT 'http average response time (ms)',

  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  INDEX (`app`, `agent`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'os info table';

CREATE TABLE IF NOT EXISTS `alarm`(
  `id` INT UNSIGNED AUTO_INCREMENT COMMENT 'unique auto increment id',
  `strategy` INT UNSIGNED NOT NULL COMMENT 'strategy id',
  `agent` VARCHAR(50) NOT NULL COMMENT 'agent name',
  `message` VARCHAR(250) NOT NULL COMMENT 'alerm message',
  `pid` INT DEFAULT NULL COMMENT 'process id',
  `gm_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'system modify timestamp',
  `gm_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'system create timestamp',
  PRIMARY KEY (`id`),
  INDEX (`strategy`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'alarm info table';

USE xprofiler_logs;
CREATE TABLE IF NOT EXISTS process_01 LIKE process;
CREATE TABLE IF NOT EXISTS process_02 LIKE process;
CREATE TABLE IF NOT EXISTS process_03 LIKE process;
CREATE TABLE IF NOT EXISTS process_04 LIKE process;
CREATE TABLE IF NOT EXISTS process_05 LIKE process;
CREATE TABLE IF NOT EXISTS process_06 LIKE process;
CREATE TABLE IF NOT EXISTS process_07 LIKE process;
CREATE TABLE IF NOT EXISTS process_08 LIKE process;
CREATE TABLE IF NOT EXISTS process_09 LIKE process;
CREATE TABLE IF NOT EXISTS process_10 LIKE process;
CREATE TABLE IF NOT EXISTS process_11 LIKE process;
CREATE TABLE IF NOT EXISTS process_12 LIKE process;
CREATE TABLE IF NOT EXISTS process_13 LIKE process;
CREATE TABLE IF NOT EXISTS process_14 LIKE process;
CREATE TABLE IF NOT EXISTS process_15 LIKE process;
CREATE TABLE IF NOT EXISTS process_16 LIKE process;
CREATE TABLE IF NOT EXISTS process_17 LIKE process;
CREATE TABLE IF NOT EXISTS process_18 LIKE process;
CREATE TABLE IF NOT EXISTS process_19 LIKE process;
CREATE TABLE IF NOT EXISTS process_20 LIKE process;
CREATE TABLE IF NOT EXISTS process_21 LIKE process;
CREATE TABLE IF NOT EXISTS process_22 LIKE process;
CREATE TABLE IF NOT EXISTS process_23 LIKE process;
CREATE TABLE IF NOT EXISTS process_24 LIKE process;
CREATE TABLE IF NOT EXISTS process_25 LIKE process;
CREATE TABLE IF NOT EXISTS process_26 LIKE process;
CREATE TABLE IF NOT EXISTS process_27 LIKE process;
CREATE TABLE IF NOT EXISTS process_28 LIKE process;
CREATE TABLE IF NOT EXISTS process_29 LIKE process;
CREATE TABLE IF NOT EXISTS process_30 LIKE process;
CREATE TABLE IF NOT EXISTS process_31 LIKE process;

CREATE TABLE IF NOT EXISTS osinfo_01 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_02 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_03 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_04 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_05 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_06 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_07 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_08 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_09 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_10 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_11 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_12 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_13 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_14 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_15 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_16 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_17 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_18 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_19 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_20 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_21 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_22 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_23 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_24 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_25 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_26 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_27 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_28 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_29 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_30 LIKE osinfo;
CREATE TABLE IF NOT EXISTS osinfo_31 LIKE osinfo;

CREATE TABLE IF NOT EXISTS alarm_01 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_02 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_03 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_04 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_05 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_06 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_07 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_08 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_09 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_10 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_11 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_12 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_13 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_14 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_15 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_16 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_17 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_18 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_19 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_20 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_21 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_22 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_23 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_24 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_25 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_26 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_27 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_28 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_29 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_30 LIKE alarm;
CREATE TABLE IF NOT EXISTS alarm_31 LIKE alarm;

