CREATE TABLE propertys(
    uuid int UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(uuid),
    eq_name varchar(255),
    eq_type varchar(255),
    brand varchar(255),
    wbdw varchar(255),
    start_time varchar(128),
    time_limit int,
    sfjz int,
    is_available int,
    local_place int,
    manager int,
    signals int
);

CREATE TABLE places(
    uuid int UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(uuid),
    group_admin int,
    dd_first varchar(10),
    dd_second varchar(10),
    dd_third int,
    dd_fourth varchar(10)
);

CREATE TABLE move_places(
    uuid int UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(uuid),
    item_id int,
    from_place int,
    to_place int,
    requester int,
    commiter int,
    req_time varchar(255),
    sign int
);

 CREATE TABLE broken(
    uuid int UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(uuid),
    item_id int,
    broke_time varchar(255),
    reason varchar(1024),
    repair_time varchar(255),
    repair_method varchar(1024)
); 

CREATE TABLE request_tb(
    uuid int UNSIGNED AUTO_INCREMENT,
    PRIMARY KEY(uuid),
    item_id int,
    requester int,
    commiter int,
    signals int,
    reason varchar(255),
    request_time varchar(255)
);

CREATE TABLE all_user(
  uuid int UNSIGNED AUTO_INCREMENT,
  PRIMARY KEY(uuid),
  account varchar(255),
  pass varchar(255),
  job int
);

create table logs(
  uuid bigint UNSIGNED AUTO_INCREMENT,
  PRIMARY KEY(uuid),
  log_time varchar(255),
  requester int,
  commiter int,
  detail varchar(1024),
  signals int
);